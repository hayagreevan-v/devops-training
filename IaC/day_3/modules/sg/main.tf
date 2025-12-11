# resource "aws_security_group" "lb_sg" {
#   vpc_id = var.vpc_id
#   ingress {
#     cidr_blocks = [var.all_ip]
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#   }
#   egress {
#     security_groups = [var.all_ip]
#     from_port       = 80
#     to_port         = 80
#     protocol        = "tcp"
#   }
# }
# resource "aws_security_group" "vm_sg" {
#   vpc_id = var.vpc_id
#   ingress {
#     # cidr_blocks = [var.all_ip]
#     security_groups = [aws_security_group.lb_sg.id]
#     from_port = 80
#     to_port   = 80
#     protocol  = "tcp"
#   }
#   ingress {
#     cidr_blocks = ["202.83.25.24/32","10.100.0.0/16"]
#     # security_groups = [aws_security_group.lb_sg.id]
#     from_port = 22
#     to_port   = 22
#     protocol  = "tcp"
#   }
#   egress {
#     cidr_blocks = [var.all_ip]
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#   }
# }


resource "aws_security_group" "lb_sg" {
  vpc_id = var.vpc_id
  name   = "${var.name}-lb-sg"

  dynamic "ingress" {
    for_each = var.lb_ingress_rules
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      cidr_blocks     = lookup(ingress.value, "cidr_blocks", null)
      security_groups = lookup(ingress.value, "security_groups", null)
    }
  }

  dynamic "egress" {
    for_each = var.lb_egress_rules
    content {
      from_port       = egress.value.from_port
      to_port         = egress.value.to_port
      protocol        = egress.value.protocol
      cidr_blocks     = lookup(egress.value, "cidr_blocks", null)
      security_groups = lookup(egress.value, "security_groups", null)
    }
  }

  tags = {
    Name = "${var.name}-lb-sg"
  }
}

resource "aws_security_group" "vm_sg" {
  vpc_id = var.vpc_id
  name   = "${var.name}-vm-sg"

  dynamic "ingress" {
    for_each = var.vm_ingress_rules
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      cidr_blocks     = lookup(ingress.value, "cidr_blocks", null)
      security_groups = lookup(ingress.value, "security_groups", null)
    }
  }

  dynamic "egress" {
    for_each = var.vm_egress_rules
    content {
      from_port       = egress.value.from_port
      to_port         = egress.value.to_port
      protocol        = egress.value.protocol
      cidr_blocks     = lookup(egress.value, "cidr_blocks", null)
      security_groups = lookup(egress.value, "security_groups", null)
    }
  }

  tags = {
    Name = "${var.name}-vm-sg"
  }
}
resource "aws_security_group" "rds_sg" {
  vpc_id = var.vpc_id
  ingress {
    # cidr_blocks = [var.all_ip]
    security_groups = [aws_security_group.vm_sg.id]
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
  }
  egress {
    cidr_blocks = [var.all_ip]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
}
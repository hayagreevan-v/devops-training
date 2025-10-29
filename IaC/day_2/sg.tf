resource "aws_security_group" "lb_sg" {
    vpc_id = aws_vpc.vpc.id
  ingress {
    cidr_blocks = [var.all_ip]
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }
  egress {
    cidr_blocks = [var.all_ip]
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
}
resource "aws_security_group" "vm_sg" {
    vpc_id = aws_vpc.vpc.id
  ingress {
    # cidr_blocks = [var.all_ip]
    security_groups = [aws_security_group.lb_sg.id]
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }
  egress {
    cidr_blocks = [var.all_ip]
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
}
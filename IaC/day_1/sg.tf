resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.vpc.id

  egress {
    cidr_blocks = [var.all_ip] 
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }
  ingress {
    cidr_blocks = [var.all_ip]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
  ingress {
    cidr_blocks = [var.all_ip]
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }
  tags = {
    Name = "${var.name}-sg"
  }
}
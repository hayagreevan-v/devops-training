resource "aws_db_instance" "this" {
  allocated_storage      = var.allocated_storage
  db_name                = "${var.name}db"
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = var.username
  password               = var.password
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [var.sg_id]
  depends_on             = [aws_db_subnet_group.this]
  tags = {
    Name = "${var.name}-db"
  }
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.name}-db-subnet-group"
  subnet_ids = var.vpc_subnets
  tags = {
    Name = "${var.name}-db-subnet-group"
  }
}
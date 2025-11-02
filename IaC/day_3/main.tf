module "vpc" {
  source = "./modules/vpc"
  name   = "${var.name}"
}

module "webserver" {
  source              = "./modules/webserver"
  vm_subnet_id        = module.vpc.public_subnet_ids[0]
  public_key          = file("key.pem.pub")
  user_data_file_name = "userdata.sh"
  lb_sg_id            = aws_security_group.lb_sg.id
  vm_sg_ids           = [aws_security_group.vm_sg.id]
  public_subnet_ids   = module.vpc.public_subnet_ids
  private_subnet_ids  = module.vpc.private_subnet_ids
  vpc_id              = module.vpc.vpc_id
  db = {
    host     = module.db.endpoint
    port     = module.db.port
    username = var.name
    password = var.name
    dbname   = "demo"
  }
  asg_desired_count = 2
  asg_max_count     = 3
  asg_min_count     = 1
  depends_on        = [module.db]
}

module "db" {
  source      = "./modules/rds"
  username    = var.name
  password    = var.name
  vpc_subnets = module.vpc.private_subnet_ids
  sg_id       = aws_security_group.rds_sg.id
}




## Security Groups
resource "aws_security_group" "lb_sg" {
  vpc_id = module.vpc.vpc_id
  name   = "${var.name}-lb-sg"

  ingress {
    description = "Allow HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-lb-sg"
  }
}

resource "aws_security_group" "vm_sg" {
  vpc_id = module.vpc.vpc_id
  name   = "${var.name}-vm-sg"

  ingress {
    description     = "Allow HTTP from Load Balancer"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.lb_sg.id]
  }

  ingress {
    description = "Allow SSH from trusted IPs"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["202.83.25.24/32","0.0.0.0/0", "10.100.0.0/16"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-vm-sg"
  }
}

resource "aws_security_group" "rds_sg" {
  vpc_id = module.vpc.vpc_id
  name   = "${var.name}-rds-sg"

  ingress {
    description     = "Allow MySQL from EC2"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.vm_sg.id]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-rds-sg"
  }
}
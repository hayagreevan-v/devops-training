resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.name}-vpc"
  }
}

resource "aws_subnet" "default" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
    tags = {
    Name = "${var.name}-public-subnet-1"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
    tags = {
    Name = "${var.name}-igw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.all_ip
    gateway_id = aws_internet_gateway.igw.id
  }
    tags = {
    Name = "${var.name}-rt"
  }
}

resource "aws_route_table_association" "rt_assoc" {
  route_table_id = aws_route_table.rt.id
  subnet_id = aws_subnet.default.id
}
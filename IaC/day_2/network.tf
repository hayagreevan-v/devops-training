# VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.name}-vpc"
  }
}

# Subnets
resource "aws_subnet" "public_subnet_1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet_1_cidr
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-public-subnet-1"
  }
}
resource "aws_subnet" "public_subnet_2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet_2_cidr
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-public-subnet-2"
  }
}
resource "aws_subnet" "private_subnet_1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_subnet_1_cidr
  availability_zone = "us-east-1a"
  tags = {
    Name = "${var.name}-private-subnet-1"
  }
}
resource "aws_subnet" "private_subnet_2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_subnet_2_cidr
  availability_zone = "us-east-1b"
  tags = {
    Name = "${var.name}-private-subnet-2"
  }
}

# Gateways
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.name}-igw"
  }
}

resource "aws_nat_gateway" "natgw" {
  subnet_id = aws_subnet.public_subnet_1.id
  allocation_id = aws_eip.nat_eip.id
 tags = {
   Name = "${var.name}-natgw"
 }
}



# Route Table

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.all_ip
    gateway_id = aws_internet_gateway.igw.id
  }
}
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.all_ip
    nat_gateway_id = aws_nat_gateway.natgw.id
  }
}

# Route Table Association

resource "aws_route_table_association" "public_rt_assoc_1" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id = aws_subnet.public_subnet_1.id
}
resource "aws_route_table_association" "public_rt_assoc_2" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id = aws_subnet.public_subnet_2.id
}

resource "aws_route_table_association" "private_rt_assoc_1" {
  route_table_id = aws_route_table.private_rt.id
  subnet_id = aws_subnet.private_subnet_1.id
}
resource "aws_route_table_association" "private_rt_assoc_2" {
  route_table_id = aws_route_table.private_rt.id
  subnet_id = aws_subnet.private_subnet_2.id
}

# Elastic IP
resource "aws_eip" "nat_eip" {
    domain = "vpc"
    tags = {
        Name = "hayagreevan-nat-eip"
    }
}
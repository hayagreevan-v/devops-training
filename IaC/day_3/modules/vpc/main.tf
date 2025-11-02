# VPC
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.name}-vpc"
  }
}

# Subnets
resource "aws_subnet" "public" {
  for_each = var.public_subnets

  availability_zone       = each.key
  cidr_block              = each.value
  vpc_id                  = aws_vpc.this.id
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-public-${each.key}"
  }
}
resource "aws_subnet" "private" {
  for_each = var.private_subnets

  availability_zone       = each.key
  cidr_block              = each.value
  vpc_id                  = aws_vpc.this.id
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-public-${each.key}"
  }
}


# Gateways
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.name}-igw"
  }
}

resource "aws_nat_gateway" "this" {
  subnet_id     = values(aws_subnet.public)[0].id
  allocation_id = aws_eip.nat_eip.id
  tags = {
    Name = "${var.name}-natgw"
  }
}



# Route Table

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = var.all_ip
    gateway_id = aws_internet_gateway.this.id
  }
}
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block     = var.all_ip
    nat_gateway_id = aws_nat_gateway.this.id
  }
}

# Route Table Association

resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public

  route_table_id = aws_route_table.public.id
  subnet_id      = each.value.id
}
resource "aws_route_table_association" "private" {
  for_each = aws_subnet.private

  route_table_id = aws_route_table.private.id
  subnet_id      = each.value.id
}

# Elastic IP
resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = "${var.name}-nat-eip"
  }
}
# VPC
resource "aws_vpc" "volvo-vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

# Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.volvo-vpc.id

  tags = {
    Name = "${var.vpc_name}-gw"
  }
}

# Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.volvo-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

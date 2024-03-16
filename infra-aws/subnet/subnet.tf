# Subnet
resource "aws_subnet" "public-subnet" {
  vpc_id            = var.vpc-value
  cidr_block        = var.public_subnet_cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.vpc_name}-public-subnet"
  }
}

# Associate Route Table with Subnet
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = var.route-table-id
}

# Security Group
resource "aws_security_group" "allow_ssh" {
  vpc_id = var.vpc-value

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_name}-allow-ssh"
  }
}


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
    cidr_blocks = ["49.36.236.172/32"]
  }

  tags = {
    Name = "${var.vpc_name}-allow-ssh"
  }
}

resource "aws_security_group" "http-sg" {
  vpc_id = var.vpc-value

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_name}-http-sg"
  }
}

resource "aws_security_group" "custom-tcp" {
  vpc_id = var.vpc-value

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_name}-custom-tcp"
  }
}
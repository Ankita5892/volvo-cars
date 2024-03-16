# EC2 Instance
resource "aws_instance" "volvo-ec2" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.subnet-value
  key_name        = var.key_name
  security_groups = var.ec2-sg

  tags = {
    Name = "${var.vpc_name}-ec2-instance"
  }
}

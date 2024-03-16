# EC2 Instance

resource "aws_instance" "volvo-ec2" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.subnet-value
  key_name        = var.key_name
 #security_groups = [var.ec2-sg, var.ec2-sg2, var.ec2-sg3]
  vpc_security_group_ids = concat(var.ec2-sg, var.ec2-sg2, var.ec2-sg3)
  tags = {
    Name = "${var.vpc_name}-ec2-instance"
  }

  # Configure connection settings for remote-exec
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/Users/ankita/my-lab/ubuntu-key.pem")
    host        = aws_instance.volvo-ec2.public_ip


  provisioner "remote-exec" {
    inline = [
      "sudo snap install docker"
    ]
  }
}

}

resource "aws_eip" "lb" {
  instance = aws_instance.volvo-ec2.id
  #domain   = "vpc"
}
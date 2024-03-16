output "subnet-value" {
  value = aws_subnet.public-subnet.id
}

output "ec2-sg" {
value = [aws_security_group.allow_ssh.name]
}

output "subnet-value" {
  value = aws_subnet.public-subnet.id
}

output "ec2-sg" {
value = [aws_security_group.allow_ssh.id]
}

output "ec2-sg2" {
value = [aws_security_group.http-sg.id]
}

output "ec2-sg3" {
value = [aws_security_group.custom-tcp.id]
}
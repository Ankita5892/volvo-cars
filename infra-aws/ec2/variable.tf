variable "vpc_name" {
  description = "Name tag for VPC and its associated resources"
  default     = "volvo-network"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
}

variable "instance_type" {
  description = "Instance type for EC2 instance"
}

variable "key_name" {
  description = "Name of the SSH key pair"
}

variable "ec2-sg" {
}

variable "ec2-sg2" {
}
variable "ec2-sg3" {
}

variable "subnet-value" {

}
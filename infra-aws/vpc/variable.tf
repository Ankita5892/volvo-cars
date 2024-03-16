variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name tag for VPC and its associated resources"
  default     = "volvo-network"
}

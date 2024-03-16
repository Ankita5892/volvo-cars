
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.27.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
  access_key = "AKIA***********"
  secret_key = "********************"
}

module "vpc" {
  source      = "./vpc"
}

module "subnet" {
source      = "./subnet"
vpc-value = module.vpc.vpc-id-value
route-table-id = module.vpc.route-table-id
}

module "ec2_instance" {
  source      = "./ec2"
  ami_id      = "ami-074254c177d57d640"
  instance_type = "t2.micro"
  subnet-value   = module.subnet.subnet-value
  ec2-sg = module.subnet.ec2-sg
  key_name    = var.key


}

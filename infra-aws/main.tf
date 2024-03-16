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
  access_key = "ADD_YOURS"
  secret_key = "ADD_YOURS"
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
  ami_id      = "ami-0d940f23d527c3ab1"
  instance_type = "t2.micro"
  subnet-value   = module.subnet.subnet-value
  ec2-sg = module.subnet.ec2-sg
  ec2-sg2 = module.subnet.ec2-sg2
  ec2-sg3 = module.subnet.ec2-sg3
  key_name    = var.key


}
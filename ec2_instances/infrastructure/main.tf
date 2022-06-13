terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.36.0"
    }
  }

  backend "s3" {
    bucket = "uc-davis-kfai-terraform-repos-state"
    key    = "all"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
}

locals {
  account_name = "clairity_evaluation_account"
}

module "networking" {
  source = "./networking"

  vpc_id = "vpc-01ddcb7b9f14ef93f"
  ingress_cidr_block = "10.16.129.112/28"
}

module "ec2" {
  source = "./ec2"

  ami = "ami-075ff764302e6e088"
  instance_type = "p3.2xlarge"
  aws_key_pair_name = "Allix5EvaluationKey"
  security_group_ids = [module.networking.allow_ssh]
  subnet_id = "subnet-0a2a1fdf1eaa75b03"
  iam_instance_profile = module.networking.iam_profile
}


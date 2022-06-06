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

  env    = "development"
  vpc_name = "allix5_vpc"
  service_name = "com.amazonaws.us-west-2.s3"
  endpoint_type = "Gateway"
  account_name = local.account_name
}

module "ec2" {
  source = "./ec2"

  ami = "ami-0593ffb7dffe7b5e8"
  instance_type = "p3.2xlarge"
  aws_key_pair_name = "Allix5EvaluationKey"
  security_group_ids = ["sg-0dbe850523b99d9d2"]
  subnet_id = "subnet-0a08999cc45f49537"
  iam_instance_profile = module.networking.iam_profile
}

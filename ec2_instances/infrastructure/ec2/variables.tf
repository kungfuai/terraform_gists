variable "ami" {
  type = string
  default = "ami-005e54dee72cc1d00"
  description = "The Amazon Managed Instance used by the EC2 instance."
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "The type of compute required for the EC2 instance."
}

variable "aws_key_pair_name" {
  type = string
  default = ""
  description = "Name of the key pair that allows access to an EC2 instance."
}

variable "security_group_ids" {
  type = list(string)
  default = ["sg-0dbe850523b99d9d2"]
  description = "The security groups needed to allow traffic into the EC2 instance."
}

variable "subnet_id" {
  type = string
  default = "subnet-0a08999cc45f49537"
  description = "The ID of the subnet that contains the EC2 instance."
}

variable "iam_instance_profile" {
  type = string
  description = "Name of the instance profile for the EC2 instance."
}
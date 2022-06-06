variable "env" {
  type = string
  description = "The environment that you are planning to provision resources for"
}

variable "vpc_name" {
  type = string
  description = "The name of the VPC instance"
}

variable "service_name" {
  type = string
  description = "The name of the AWS service or partner that the endpoint connects to"
}

variable "endpoint_type" {
  type = string
  description = "The type of endpoint - Interface, Gateway or Gateway Load Balancer - used for connecting to an AWS service or partner"
}

variable "account_name" {
  type = string
  description = "The name of the account that the Terraform scripts relate to"
}
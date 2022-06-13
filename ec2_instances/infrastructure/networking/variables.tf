variable "ingress_cidr_block" {
  type = string
  description = "The CIDR block that pertains to the incoming traffic for a resource"
}

variable "vpc_id" {
  type = string
  description = "The ID that relates the existing virtual private cloud"
}
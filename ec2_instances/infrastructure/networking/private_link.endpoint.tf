resource "aws_vpc_endpoint" "s3" {
  vpc_id            = module.vpc.vpc_id
  service_name      = var.service_name
  vpc_endpoint_type = var.endpoint_type
}

resource "aws_vpc_endpoint_route_table_association" "s3_endpoint" {
  route_table_id = module.vpc.private_route_table_ids[0]
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}
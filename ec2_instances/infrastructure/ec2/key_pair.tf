resource "aws_key_pair" "deployed_key" {
  key_name   = var.aws_key_pair_name
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBByN0oKE1Qb7BNKckRsyE8dVOZkhW+B1bpKdSJe4naF krishi@Krishis-MacBook-Pro.local"
}
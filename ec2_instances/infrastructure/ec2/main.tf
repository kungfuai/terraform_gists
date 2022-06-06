resource "aws_network_interface" "this" {
  subnet_id = var.subnet_id
  tags = {
        Name = "TerraformEvaluationTestNetworkInterface"
  }
  security_groups = var.security_group_ids
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = aws_key_pair.deployed_key.key_name
  iam_instance_profile = var.iam_instance_profile

  network_interface {
    network_interface_id = aws_network_interface.this.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  root_block_device {
    volume_size = 256
    volume_type = "gp3"
  }

  tags = {
    Name = "TerraformEvaluationTest"
  }
}


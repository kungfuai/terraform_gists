output "iam_profile" {
  value = aws_iam_instance_profile.task_profile.name
}

output "allow_ssh" {
  value = aws_security_group.allow_ssh.id
}

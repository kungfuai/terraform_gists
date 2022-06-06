resource "aws_iam_role" "task_role" {
  name               = "s3_read_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  tags = {
    Terraform = true
    Account   = var.account_name
  }
}


resource "aws_iam_role_policy" "task_policy" {
  name = "s3_read_policy"
  role = aws_iam_role.task_role.name

  policy = <<POLICY
{
   "Version":"2012-10-17",
   "Statement":[
      {
         "Effect":"Allow",
         "Action":[
            "s3:GetObject",
            "s3:GetObjectVersion"
         ],
         "Resource":[
            "arn:aws:s3:::ucd-clairity/*"
         ]
      }
   ]
}
POLICY
}

resource "aws_iam_instance_profile" "task_profile" {
  name  = "s3_read_profile"
  role = aws_iam_role.task_role.name
}

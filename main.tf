## Module

module "ec2_module" {
    source         = "./terraform_102/module/ec2"
    instance_type  = var.instance_type
    key_name       = var.key_name
    instance_name  = var.instance_name
    policy_arn = var.policy_arn
    policy_name = var.policy_name
    role_name = var.role_name
    aws_iam_role_policy = var.aws_iam_role_policy
    instance_profile_name = var.instance_profile_name
    assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Defining the EC2 instance

resource "aws_instance" "bakor_ec2" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name =var.key_name
  security_groups = [aws_security_group.allow_ssh.name]
iam_instance_profile = var.instance_profile_name
  tags = {
    Name = var.instance_name
  }
}
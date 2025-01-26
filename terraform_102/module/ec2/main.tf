data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners = [ "amazon" ]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Defining the EC2 instance

resource "aws_instance" "bakor_ec2" {
  ami = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type
  key_name =var.key_name
  subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  iam_instance_profile = var.instance_profile_name

 tags = {
    Name = var.instance_name
  }

   provisioner  "local-exec" {
  command = "echo 'Instance Public IP ${aws_instance.bakor_ec2.public_ip}' > terraform_output.txt"
}
}
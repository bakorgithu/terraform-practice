# Defining the EC2 instance

resource "aws_instance" "bakor_ec2" {
  ami = "ami-0df8c184d5f6ae949"
  instance_type = "t3.micro"
  key_name = "bakor_test"
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "bakor"
  }
}
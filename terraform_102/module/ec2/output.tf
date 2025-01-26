output "instance_publicip" {
    value = aws_instance.bakor_ec2.public_ip
}

output "instance_id" {
    value = aws_instance.bakor_ec2.id
}

output "instance_privateip" {
  value = aws_instance.bakor_ec2.private_ip
}



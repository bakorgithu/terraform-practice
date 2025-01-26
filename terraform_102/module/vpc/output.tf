###

output "vpcid" {
  value = aws_vpc.bakorvpc.id
}

output "publicsubnet1id" {
  value = aws_subnet.public-subnet-1.id
}

output "publicsubnet2id" {
  value = aws_subnet.public-subnet-2.id
}

output "privatesubnet1id" {
  value = aws_subnet.private-subnet-1.id
}

output "privatesubnet2id" {
  value = aws_subnet.private-subent-2
}
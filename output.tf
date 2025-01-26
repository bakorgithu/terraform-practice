

output "instanceip" {
  value = module.ec2_module.instance_publicip
}

output "instanceid" {
  value = module.ec2_module.instance_id
}

output "vpc_id" {
  value = module.vpc_module.vpcid
}

output "public_subnet1id" {
  value = module.vpc_module.publicsubnet1id
}

output "public_subnet2id" {
  value = module.vpc_module.publicsubnet2id
}

output "private_subnet1id" {
  value = module.vpc_module.privatesubnet1id
}

output "private_subnet2id" {
  value = module.vpc_module.privatesubnet2id
}
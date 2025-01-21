

output "publicip" {
  value = module.ec2_module.ip
}

output "instanceid" {
  value = module.ec2_module.id
}
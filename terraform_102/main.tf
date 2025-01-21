## Module

module "ec2_module" {
  source = "./terraform_102/module/ec2"
  instance_type = "t3.micro"
  key_name = "ivo-test"
  instance_name = "Ivo"
}
## variables

variable "ami_id" {
type = string
default = "ami-0df8c184d5f6ae949"
}

variable "instance_type" {
    type = string
    default = "t3.micro"  
}

variable "instance_name" {
    type = string
    default = "bakor-ec2"
}

variable "region" {
    type = string
    default = "us-east-1"
}

variable "key_name" {
    type = string
}

variable "role_name" {
    type = string
    default = "ec2-role-production"
}

variable "policy_name" {
    type = string
}

variable "instance_profile_name" {
    type = string
}

variable "aws_iam_role_policy" {
  type = string
  description = "Define the inline policy"
  default = null
}

variable "assume_role_policy" {
    type = string
}

variable "policy_arn" {
  type = string
  description = "AWS managed policy attachment to an iam role"
  default = null
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
  default = "aws_subnet.public-subnet-1"
}
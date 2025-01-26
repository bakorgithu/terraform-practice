variable "region" {
  type = string
  default = "us-east-1"
  description = "provide the aws region"
}

variable "policy_arn" {
  type = string
}

variable "policy_name" {
    type = string
}

variable "role_name" {
    type = string
}

variable "assume_role_policy" {
    type = string
}

variable "aws_iam_role_policy" {
    type = string
}

variable "instance_profile_name" {
    type = string
}

variable "key_name" {
type = string  
}

variable "instance_type" {
  type = string
}

variable "instance_name" {
  type = string
  
}

variable "aws_vpc_name" {
  type = string
}
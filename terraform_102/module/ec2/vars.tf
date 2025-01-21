## variables

variable "ami_id" {
type = string
default = "ami-0df8c184d5f6ae949"
}

variable "instance_type" {
    type = string
    default = "t2.micro"  
}

variable "instance_name" {
    type = string
    default = "bakor"
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
}

variable "policy_name" {
    type = string
}

variable "instance_profile_name" {
    type = string
}

variable "aws_iam_role_policy" {
    type = string
}

variable "assume_role_policy" {
    type = string
}

variable "policy_arn" {
  type = string
}
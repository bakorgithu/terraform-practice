variable "region" {
  type = string
}

variable "instance_tenancy" {
  type = string
  default = "default"
}

variable "cidr_block_vpc" {
  type = string
  description = "Define the vpc cidr block"
  default = "10.0.0.0/16"
}

variable "aws_vpc_name" {
  type = string
  description = "Define the vpc name"
  #default = "example_vpc"
}

variable "cidr_block_pub-subnet-1" {
  type = string
  default = "10.0.1.0/24"
}

variable "name_pub_subnet-1" {
  type = string
  default = "ivo-subnet-1"
}

variable "cidr_block_pub_subnet-2" {
  type = string
  default = "10.0.3.0/24"
}

variable "name_pub_subnet-2" {
  type = string
  default = "ivo-subnet-2"
}

variable "name_igw" {
  type = string
  default = "ivo-gateway"
}

variable "cidr_block_rtb_pubsubnet" {
  type = string
  default = "0.0.0.0/0"
}

variable "rtb_name_pubsubnet" {
  type = string
  default = "ivo-routetable"
}

variable "cidr_block_priv_subnet-1" {
  type = string
  default = "10.0.2.0/24"
}

variable "name_priv_subnet-1" {
  type = string
  default = "bakor-subnet-1"
}

variable "cidr_block_priv_subnet-2" {
  type = string
  default = "10.0.4.0/24"
}

variable "name_priv_subnet-2" {
  type = string
  default = "bakor-subnet-2"
}

variable "nat_gateway_1_name" {
  type = string
  default = "ivo-nat-1"
}

variable "nat_gateway_2_name" {
  type = string
  default = "ivo-nat-2"
}

variable "cidr_block_rtb1_privsubnet" {
  type = string
  default = "0.0.0.0/0"
}

variable "cidr_block_rtb2_privsubnet" {
  type = string
  default = "0.0.0.0/0"
}
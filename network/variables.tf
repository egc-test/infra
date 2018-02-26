#
# variaibles.tf
#   to override default settings defined here, set env variables with same names starting with TF_VAR_<variable name>
#   more info in terraform documentation: https://www.terraform.io/intro/getting-started/variables.html

# aws provider vars
variable "aws_access_key" {
  description = "Access key for Amazon AWS account"
  default = "ovverride me from env var TF_VAR_aws_access_key"
}

variable "aws_secret_key" {
  description = "Secret key for Amazon AWS account"
  default = "ovverride me from env var TF_VAR_aws_secret_key"
}

variable "aws_region" {
  description = "Region where the AWS resource will be created"
  default = "us-east-1"
}

# General configuration

variable "environment" {
  description = "Environment name"
  default = "development01"
}

# network configuration
variable "vpc_name" {
  description = "Specify a name for a VPC"
  default = "vnet1"
}

variable "vpc_cidr" {
  description = "CIDR block for a VPC network"
  default = "192.168.0.0/16"
}

# subnet 1
variable "subnet1_name" {
  description = "Specify a name for a subnet"
  default = "subnet_a"
}

variable "subnet1_cidr" {
  description = "CIDR block for a subnet"
  default = "192.168.1.0/24"
}

variable "subnet1_zone" {
  description = "Specify Availability Zone for a subnet"
  default = "us-east-1a"
}

# subnet 2
variable "subnet2_name" {
  description = "Specify a name for a subnet"
  default = "subnet_a"
}

variable "subnet2_cidr" {
  description = "CIDR block for a subnet"
  default = "192.168.2.0/24"
}

variable "subnet2_zone" {
  description = "Specify Availability Zone for a subnet"
  default = "us-east-1b"
}

variable "gw_name" {
  description = "Specify Availability name for internet gateway"
  default = "gateway1"
}

# security group configuration
variable "sg_name" {
  description = "Specify a name for a Security Group"
  default = "office"
}

variable "sg_desc" {
  description = "Specify a description for a Security Group"
  default = "Allow ALL ports inside security group and port 22 from World"
}
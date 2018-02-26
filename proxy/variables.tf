#
# variaibles.tf
#   to override default settings defined here, set env variables with same names starting with TF_VAR_<variable name>
#   more info in terraform documentation: https://www.terraform.io/intro/getting-started/variables.html

# aws provider vars
variable "aws_access_key" {
  description = "Access key for Amazon AWS account"
  default = "override me from env var TF_VAR_aws_access_key"
}

variable "aws_secret_key" {
  description = "Secret key for Amazon AWS account"
  default = "override me from env var TF_VAR_aws_secret_key"
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

# Autoscaling Group configuration

variable "asg_name" {
  description = "Autoscaling group name"
  default = "asg-proxy"
}

variable "asg_min_size" {
  description = "Autoscaling group min size"
  default = 1
}

variable "asg_max_size" {
  description = "Autoscaling group max size"
  default = 1
}

variable "asg_desired_capacity" {
  description = "Autoscaling group desired capacity"
  default = 1
}

variable "asg_health_check_grace_period" {
  description = "Time (in seconds) after instance comes into service before checking health"
  default = 300
}

variable "asg_health_check_type" {
  description = "'EC2' or 'ELB'. Controls how health checking is done"
  default = "EC2"
}

variable "asg_subnet_ids" {
  description = "Specify a list of subnets for autoscaling group"
  default = ["subnet-0b3be7bb410f3b206", "subnet-0b348404f9e265a40"]
}

# Launch configuration

variable "lc_name_prefix" {
  description = "Launch configuration name prefix"
  default = "lc-proxy-"
}

## lc instance configuration

variable "lc_instance_name" {
  description = "Specify a Name tag for instances"
  default = "proxy-lin64"
}

variable "lc_instance_keypair_name" {
  description = "Keypair to access instance"
  default = "override me from env var TF_VAR_aws_keypair_name"
}

variable "lc_instance_security_groups" {
  description = "Additional security groups to attach to instances (i.e. office access)"
  default = ["sg-09feee92975777974"]
}

variable "lc_instance_ami" {
  description = "Define AMI for the instance"
  default = "ami-4bf3d731"
}

variable "lc_instance_type" {
  description = "Define an instance type for the machine"
  default = "t2.micro"
}

variable "lc_instance_volume_type" {
  description = "The type of volume. Can be 'standard', 'gp2', or 'io1'"
  default = "gp2"
}

variable "lc_instance_volume_size" {
  description = "The size of the volume in gigabytes"
  default = 8
}

variable "lc_instance_user_data_file" {
  description = "Supply user data script to provision the instances on launch"
  default = "../user_data.sh"
}

# network and security group configuration

## specify a subnet_id of existing subnet to connect an instance to it (see README.md for further details)
variable "vpc_id" {
  description = "Specify a VPC to use for this instance"
  default = "vpc-0014d5891b5951082"
}

variable "sg_name" {
  description = "Specify a name for secrurity group"
  default = "proxy"
}

variable "sg_description" {
  description = "Specify a description for secrurity group"
  default = "Security group for proxy service"
}

## configure routing
variable "route53_zone_id" {
  description = "Provide a route53 zone id to register service"
  default = "Z2QBKCDI4UPRIY"
}
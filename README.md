# AWS instance managing
Manage aws network and instances from TF script

This repo contains two folders:
* network - manage network and security group
* instance - manage instances

## HOWTO run

1. Install
2. Create a Network Infra (`network` folder)
3. Create an Instance (`instance` folder)
4. Connect to Instance

### 1. Install

#### 1.1 Clone this repo
Clone this repo to a local folder:

`git clone https://github.com/gp42/aws_script20180202`

#### 1.2 Install Terraform
Please refer to terraform documentation: https://www.terraform.io/intro/getting-started/install.html

Basically just download the latest terraform package and place `terraform` file to `/usr/local/bin`


### 2. Create Network Infra
Please check `network/security_group.tf` for security group settings.
Currently it allows ALL communication within security group and SSH on port 22 from World.
This is NOT secure, limit port 22 access for production use.

#### 2.1 Create Network Infra
1. Go to `network` folder
2. Set public variables
* Required variables (see `variables.tf` for descriptions):
  * TF_VAR_aws_access_key
  * TF_VAR_aws_secret_key
* Optional variables:
  * See `variables.tf` file
3. Run `terraform init` - only need to do it one time.
4. Run `terraform apply`
5. You will receive a `subnet_id` and a `sg_id` value, store them to env vars
`TF_VAR_subnet_id` and `TF_VAR_sg_id` to use it for new instances

#### 2.2 Modify Network Infra
1. Update `.tf` files with new configuration
2. Run `terraform apply`

#### 2.3 Delete Network Infra
1. Run `terraform destroy`

### 3. Create Instance
The state is stored in `terraform.tfstate` file.
To create multiple instances you can move this file after instance creation to some other folder (i.e. `instance/instance1` folder)
and run '3.1 Create Instance' steps again, which will generate a new state file in `instance` folder.

Another approach would be just to make several copies of `instance` folder

Create Instance will generate a RSA key with a random name in keys folder.

**NOTE:** terraform.tfstate file will contain RSA key in plaintext, which is a limitation of terraform.

#### 3.1 Create Instance
1. Set public variables
* Required variables (see `variables.tf` for descriptions):
  * TF_VAR_aws_access_key
  * TF_VAR_aws_secret_key
  * TF_VAR_subnet_id
  * TF_VAR_sg_id
* Optional variables:
  * See `variables.tf` file
2. Run `terraform init` - you only need to do it once
3. Run `terraform apply`

#### 3.2 Modify Instance
1. Update `.tf` files with new configuration
2. Run `terraform apply`

#### 3.3 Delete Instance
1. Run `terraform destroy`

### 4. Connect to Instance
You can use ssh to connect:

`ssh -i <key.pem> root@<public_DNS_name>`

# Useful links
1. Managing variables in terraform:
https://www.terraform.io/intro/getting-started/variables.html

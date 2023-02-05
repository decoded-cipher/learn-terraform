variable "access_key" {
    type = string
    description = "The AWS access key to use."
    default = "your_IAM_access_key"
}

variable "secret_key" {
    type = string
    description = "The AWS secret key to use."
    default = "your_IAM_secret_key"
}

variable "key_name" {
    type = string
    description = "The key name to use for the instance."
    default = "your_SSH_key_name"
}


# -------------------------------------------------------------------------


variable "name" {
    type = string
    description = "The name of the server."
}

variable "ami" {
    type = string
    description = "The AMI to use for the instance."
}

variable "instance_type" {
    type = string
    description = "The type of instance to start."
}

variable "region" {
    type = string
    description = "The AWS region to use."
}

variable "cidr_block" {
    type = string
    description = "The CIDR block to use for the VPC."
}

variable "availability_zone" {
    type = string
    description = "The availability zone to use for the subnet."
}
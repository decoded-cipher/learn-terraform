provider "aws" {
    region          = var.region
    access_key      = var.access_key
    secret_key      = var.secret_key
}

resource "aws_instance" "terraform_instance" {
    ami             = var.ami
    instance_type   = var.instance_type
    key_name        = var.key_name
    tags            = {
        Name        = "${var.name}_instance"
    }
}

resource "aws_vpc" "terraform_vpc" {
    cidr_block              = var.cidr_block
    enable_dns_support      = true
    enable_dns_hostnames    = true
    tags                    = {
        Name                = "${var.name}_vpc"
    }
}

resource "aws_subnet" "terraform_subnet" {
    vpc_id                  = aws_vpc.terraform_vpc.id
    cidr_block              = var.cidr_block
    availability_zone       = var.availability_zone
    map_public_ip_on_launch = true
    tags                    = {
        Name                = "${var.name}_subnet"
    }
}
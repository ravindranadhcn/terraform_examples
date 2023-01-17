terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region = "us-east-1"
}

module "tomcat_vpc" {
  source = "../modules/services/network/vpc"
  vpc_cidr = var.tomcat_vpc_cidr
  vpc_name = var.tomcat_vpc_name
}

module "tomcat_public_subnet" {
  source = "../modules/services/network/subnet"
  vpd_id = module.tomcat_vpc.vpc_id
  subnet_cidr_block = var.tomcat_pub_subnet_cidr
  subnet_name = var.tomcat_pub_subnet_name
  az = var.tomcat_az
}

module "tomcat_ig" {
  source = "../modules/services/network/ig"
  vpc_id = module.tomcat_vpc.vpc_id
  ig_name = var.tomcat_ig_name
  vpc_subnet_id = module.tomcat_public_subnet.subnet_id
  route_cidr = var.tomcat_route_cidr
}

module "tomcat_security_group" {
  source = "../modules/services/network/securitygroup"
  vpc_id = module.tomcat_vpc.vpc_id
  security_group_name = var.tomcat_security_group_name
  ingress = ({
    cidr_blocks = var.tomcat_ingress.cidr_blocks
    from_port = var.tomcat_ingress.from_port
    protocol = var.tomcat_ingress.protocol
    to_port = var.tomcat_ingress.to_port
  })
}

module "tomcat_keypair" {
  source = "../modules/services/compute/keypair"
  public_key = var.tomcat_public_key
  key_name =  var.tomcat_key_name
}

module "tomcat_ec2" {
  source = "../modules/services/compute/ec2"
  instance_type = var.instance_type
  instance_name = var.instance_name
  subnet_id = module.tomcat_public_subnet.subnet_id
  ami= var.ami
  key_name = module.tomcat_keypair.keypair_id
  security_group_id = module.tomcat_security_group.security_group_id
  associate_public_id_address = var.associate_public_id_address
}
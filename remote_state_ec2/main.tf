terraform {
  required_providers {
    aws={
        source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "tomcat-tf-state-manager"
    region = "us-east-1"
    key = "terraform.tfstate"
    dynamodb_table = "tomcat-tf-db-state-manager"
}
}

provider "aws" {
  region = "us-east-1"
  profile = "default"
}

resource "aws_key_pair" "tomcatkp" {
  key_name = "tomcatkp"
  public_key = var.ec2config.public_key
}
resource "aws_instance" "ec2" {
    instance_type = var.ec2config.instance_type
    ami = var.ec2config.ami
    key_name = aws_key_pair.tomcatkp.key_name
    associate_public_ip_address = var.ec2config.associate_public_ip_address
    tags = {
      "Name" = var.ec2config.instance_name
    }
}
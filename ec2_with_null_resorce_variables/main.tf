terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
#AWS Provider with region, shared config file and profile
provider "aws" {
  region              = "us-east-1"
  shared_config_files = ["~/.aws/credentials"]
  profile             = "default"
}
# AWS resource with aws_iam_user
resource "aws_iam_user" "iam_users" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}

variable "user_names" {
  type        = list(string)
  description = "IAM User names"
  default     = ["user1", "user2", "user3"]
}
#AWS Resource with aws_instace.
resource "aws_instance" "my_ec2" {
  ami                         = "ami-0aa2b7722dc1b5612"
  instance_type               = var.instance_type
  associate_public_ip_address = var.enable_public_ip
  count                       = var.instance_count
  tags                        = var.ec2_tags
}
#Resource with Null Resource with Triggers
resource "null_resource" "install_apache_on_web_server" {
  triggers = {
    #id = aws_instance.my_ec2.id
    id = timestamp()
  }
  provisioner "local-exec" {
    command = "echo Hello World >> test.out"
  }
}


variable "ec2_tags" {
  description = "Ec2 Tags Information"
  type        = map(string)
  default = {
    "Name"  = "my-web01",
    "Env"   = "Dev UI"
    "Owner" = "Ravi Nimmagadda"
  }
}
variable "instance_type" {
  type        = string
  description = "Type of the instance"
  default     = "t2.micro"
}
variable "instance_count" {
  type        = number
  description = "No Of Instances"
  default     = 1
}
variable "enable_public_ip" {
  description = "Enable public IP address"
  type        = bool
  default     = true
}



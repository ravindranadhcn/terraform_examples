resource "aws_instance" "ec2" {
  instance_type = var.instance_type
  ami = var.ami
  subnet_id = var.subnet_id
  associate_public_ip_address = var.associate_public_id_address
  security_groups = [var.security_group_id]
  key_name = var.key_name
  tags = {
    "Name" = var.instance_name
  }
}
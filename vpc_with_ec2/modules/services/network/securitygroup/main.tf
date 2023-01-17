resource "aws_security_group" "sg" {
  vpc_id = var.vpc_id
  ingress {
    from_port = var.ingress.from_port
    to_port = var.ingress.to_port
    protocol = var.ingress.protocol
    cidr_blocks = var.ingress.cidr_blocks
  }
  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "Allow all traffic"
    from_port = 0
    protocol = -1
    to_port = 0
  }
  tags = {
    "Name" = var.security_group_name
  }
}
tomcat_vpc_cidr = "162.0.0.0/16"
tomcat_vpc_name = "tomcat_vpc"
tomcat_pub_subnet_cidr = "162.0.1.0/24"
tomcat_pub_subnet_name = "tomcat_public_subnet"
tomcat_az = "us-east-1a"
tomcat_ig_name = "tomcat_ig"
tomcat_route_cidr = "0.0.0.0/0"
tomcat_security_group_name = "tomcat_sg"
tomcat_ingress = {
  cidr_blocks = ["0.0.0.0/0"]
  from_port = 22
  protocol = "TCP"
  to_port = 22
}
instance_name = "tomcat2"
instance_type = "t2.micro"
ami = "ami-06878d265978313ca"

associate_public_id_address = true
tomcat_key_name = "tomcatkp"
tomcat_public_key = // Please add you public key

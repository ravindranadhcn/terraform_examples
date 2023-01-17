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
tomcat_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDV89jMWjbsfG5EELrHBnnBAG/SpyycgOwbZaUV89wd8mhHHeca402DXrGXrMBYYuyZfjWRHRKcnUk3ojagSuylX10K+HLVKgDhaed4odd92Lb2u04+zbnkX8yeQ4JVlXNFM3l66Q1HUePNNc1ewvLrvB/uZzWbpMTVfZFfhTiTqIAI2kZEh8CepJLnGEi2M5dV15YDpn+n6X91ZQAzHgWSBqNpsTmPwILPOQnhS5TxDcjVtx8IWzRkTsK2wVS2Ppbot4ccYIwJ7Il7XqiEA3AhhposoLFdBE3AgoAEvG2P17/vcFxcwE+jZaE2UEANeZHy9zCxXZWvb7icuQYFlyVl/LpsFen+DtpWJ/gxBQuCJK1koA/4j2wK8lqq5vNCX0tGmYx1YgPsMyH20qu09su3AxcJ5lv/ydE7SR0+vF9tGOrrqUzUaaSr/tIs+O6r2tatbJ8FKAshFHAPZrdZtg98YKr3hbq49BuAOdTSlVmAbGeuhubO0IGyt+E9m80xrcc= ravindranadhcn@RavindrnadhsMBP"
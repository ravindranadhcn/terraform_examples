variable "ec2config" {
    type = object({
        instance_type   = string
        instance_name   = string
        ami = string
        public_key = string
        associate_public_ip_address = bool
    })
}
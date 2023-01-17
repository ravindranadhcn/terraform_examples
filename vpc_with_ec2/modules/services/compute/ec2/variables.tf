variable "instance_type" {
  type = string
}
variable "ami" {
  type = string
}

variable "key_name" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "associate_public_id_address" {
  type = bool
}

variable "subnet_id" {
  type = string
}

variable "instance_name" {
  type = string
}
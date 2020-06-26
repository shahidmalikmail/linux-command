variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default = "10.1.0.0/16"
}
variable "cidr_subnet" {
  description = "CIDR block for the subnet"
  default = "10.1.0.0/24"
}
variable "availability_zone" {
  description = "availability zone to create subnet"
  default = "ap-south-1a"
}

variable "key_path" {
default = "/home/amiga/amiga.pem"
}
variable "key_name" {
default = "amiga"
}

variable "instance_ami" {
  description = "AMI for aws EC2 instance"
  default = "ami-009110a2bf8d7dd0a"
}
variable "instance_type" {
  description = "type for aws EC2 instance"
  default = "t2.micro"
}
variable "environment_tag" {
  description = "Environment tag"
  default = "Production"
}
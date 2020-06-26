
## Varibales Code for all mail servers Amiga Informatics.
variable "aws_region" {
	default = "ap-south-1"
}

variable "key_path" {
default = "/home/amiga/amiga.pem"
}
variable "key_name" {
default = "amiga"
}
variable "instanceTenancy" {
 default = "default"
}

variable "vpc_cidr" {
	default = "10.0.0.0/18"
}

variable "subnets_cidr" {
	type = "list"
	default = ["10.0.0.0/20", "10.0.16.0/20"]
}

variable "azs" {
	type = "list"
	default = ["ap-south-1a", "ap-south-1b"]
}

variable "webservers_ami" {
  default = "ami-009110a2bf8d7dd0a"
}

variable "instance_type" {
  default = "t2.micro"
}

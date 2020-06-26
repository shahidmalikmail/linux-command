# Create Variables for all Terraform Coding
variable "aws_region" {
	default = "ap-south-1"
}

variable "vpc_cidr" {
	default = "10.20.0.0/16"
}

variable "subnets_cidr" {
	type = "list"
	default = ["10.20.1.0/24", "10.20.2.0/24"]
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

variable "key_path" {
default = "/home/amiga/pc.pem"
}

variable "key_name" {
default = "pc"
}

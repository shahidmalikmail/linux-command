## Varibles for terraform code.

variable "aws_region" {
	default = "ap-south-1"
}

variable "key_name" {
default = "tothenew"
}

variable "count" {
	default = "2"
}

variable "tenancy" {
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

variable "docker_host_ami" {
  default = "ami-0ebd654017556e025"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "volume_type" {
	default = "gp2"
}

variable "volume_size" {
	default = "15"
}

provider "aws" {
region = "ap-south-1"
access_key = "AKIAQ2R2U26PQDW35HCT"
secret_key = "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"
}


variable "vpc_id" {
default = "vpc-2b7f4443"
}

variable "subnet_id" {
default = "subnet-015ec84d"
}

variable "security_group" {
default = "sg-bd7066d2"
}

variable "key_path" {
default = "/home/amiga/pc.pem"
}


variable "key_name" {
default = "pc"
}


variable "ami_id" {
default = "ami-009110a2bf8d7dd0a"
}

variable "instance_type" {
default = "t2.micro"
}

variable "volume_type" {
default = "gp2"
}

variable "volume_size" {
default = "8"
}

variable "count" {
default = "1"
}

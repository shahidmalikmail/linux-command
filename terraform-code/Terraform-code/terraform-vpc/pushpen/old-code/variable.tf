## Freeshop-Project Create Variable
provider "aws" {
  access_key = "AKIAQ2R2U26PQDW35HCT"
  secret_key = "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"
  region     = "ap-south-1"
}

variable "region" {
 default = "ap-south-1"
}


variable "availability_zone" {
	type = "list"
	default = ["ap-south-1a", "ap-south-1b"]
}

variable "instanceTenancy" {
 default = "default"
}

variable "instance_type" {
 default = "t2.micro"
}

variable "ami_id" {
default = "ami-009110a2bf8d7dd0a"
}
variable "dnsSupport" {
 default = true
}
variable "dnsHostNames" {
        default = true
}
variable "vpc-CIDR-block" {
 default = "10.20.0.0/16"
}
variable "public-subnet" {
        type = "list"
	default = ["10.20.1.0/24", "10.20.2.0/24"]
        
}


variable "destinationCIDRblock" {
        default = "0.0.0.0/0"
}
variable "ingressCIDRblock" {
        type = "list"
        default = [ "0.0.0.0/0" ]
}
variable "mapPublicIP" {
        default = true
}

variable "key_path" {
default = "/home/amiga/pc.pem"
}
variable "key_name" {
default = "pc"
}

# end of variables.tf

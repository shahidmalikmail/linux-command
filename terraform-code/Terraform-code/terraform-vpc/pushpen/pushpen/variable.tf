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
        default = "ap-south-1b"
}

variable "availability_zone-2" {
        default = "ap-south-1a"
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
 default = "10.0.0.0/16"
}
variable "public-subnet" {
        default = "10.0.32.0/20"
}

variable "private-subnet" {
        default = "10.0.16.0/20"
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

//vpc.tf
# Create VPC/Subnet/Security Group/ACL
#provider "aws" {
 //       region     = "${var.region}"
//} 
# end provider
# create the VPC
resource "aws_vpc" "My_VPC" {
  cidr_block           = "${var.vpcCIDRblock}"
  instance_tenancy     = "${var.instanceTenancy}"
  enable_dns_support   = "${var.dnsSupport}"
  enable_dns_hostnames = "${var.dnsHostNames}"
tags {
    Name = "test-vpc"
  }
} 
# end resource
# create the Subnet
resource "aws_subnet" "My_VPC_Subnet" {
  vpc_id                  = "${aws_vpc.My_VPC.id}"
  cidr_block              = "${var.subnetCIDRblock}"
  map_public_ip_on_launch = "${var.mapPublicIP}"
  availability_zone       = "${var.availability_zone}"
tags = {
   Name = "My VPC Subnet"
  }
} 

resource "aws_subnet" "My_private_Subnet" {
  vpc_id                  = "${aws_vpc.My_VPC.id}"
  cidr_block              = "${var.subnetprivteblock}"
  map_public_ip_on_launch = "${var.mapPublicIP}"
  availability_zone       = "${var.availability_zone}"
tags = {
   Name = "My VPC Subnet"
  }
} 
# end resource

# create VPC Network access control list
resource "aws_network_acl" "My_VPC_Security_ACL" {
  vpc_id = "${aws_vpc.My_VPC.id}"
  subnet_ids = [ "${aws_subnet.My_VPC_Subnet.id}" ]
# allow port 22
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.destinationCIDRblock}"
    from_port  = 22
    to_port    = 22
  }
# allow ingress ephemeral ports
  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "${var.destinationCIDRblock}"
    from_port  = 1024
    to_port    = 65535
  }
# allow egress ephemeral ports
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.destinationCIDRblock}"
    from_port  = 1024
    to_port    = 65535
  }
tags {
    Name = "My VPC ACL"
  }
} 
# end resource
# Create the Internet Gateway
resource "aws_internet_gateway" "My_VPC_GW" {
  vpc_id = "${aws_vpc.My_VPC.id}"
tags {
        Name = "My VPC Internet Gateway"
    }
} 
# end resource
# Create the Route Table
resource "aws_route_table" "My_VPC_route_table" {
    vpc_id = "${aws_vpc.My_VPC.id}"
tags {
        Name = "My VPC Route Table"
    }
} 
# end resource
# Create the Internet Access
resource "aws_route" "My_VPC_internet_access" {
  route_table_id        = "${aws_route_table.My_VPC_route_table.id}"
  destination_cidr_block = "${var.destinationCIDRblock}"
  gateway_id             = "${aws_internet_gateway.My_VPC_GW.id}"
} 
# end resource
# Associate the Route Table with the Subnet
resource "aws_route_table_association" "My_VPC_association" {
    subnet_id      = "${aws_subnet.My_VPC_Subnet.id}"
    route_table_id = "${aws_route_table.My_VPC_route_table.id}"
} 
# end resource
# end vpc.tf

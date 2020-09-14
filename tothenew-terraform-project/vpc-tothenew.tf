# VPC 
resource "aws_vpc" "tothenew_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  
  tags {
    Name = "ToTheNew-VPC"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "tothenew_igw" {
  vpc_id = "${aws_vpc.tothenew_vpc.id}"
  tags {
    Name = "ToTheNew-IGW"
  }
}

# Subnets : public
resource "aws_subnet" "tothenew_subnet" {
  count = "${length(var.subnets_cidr)}"
  vpc_id = "${aws_vpc.tothenew_vpc.id}"
  cidr_block = "${element(var.subnets_cidr,count.index)}"
  availability_zone = "${element(var.azs,count.index)}"
  map_public_ip_on_launch = true
  tags {
    Name = "Tothenew-Sub-${count.index+1}"
  }
}

# Route table:  
resource "aws_route_table" "tothenew_rt" {
  vpc_id = "${aws_vpc.tothenew_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.tothenew_igw.id}"
  }
  tags {
    Name = "Tothenew-RT"
  }
}

# Route table association with public subnets
resource "aws_route_table_association" "association" {
  count = "${length(var.subnets_cidr)}"
  subnet_id      = "${element(aws_subnet.tothenew_subnet.*.id,count.index)}"
  route_table_id = "${aws_route_table.tothenew_rt.id}"
}


# create VPC Network access control list
resource "aws_network_acl" "tothenew_acl" {
  vpc_id = "${aws_vpc.tothenew_vpc.id}"
  subnet_ids = ["${aws_subnet.tothenew_subnet.*.id}"]
# allow port number
  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

# allow egress ephemeral ports
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
tags {
    Name = "Tothenew-ACL"
  }
} 
# end resource
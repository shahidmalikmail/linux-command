# Create the Security Group
resource "aws_security_group" "My_VPC_Security_Group" {
  vpc_id       = "${aws_vpc.My_VPC.id}"
  name         = "My VPC Security Group"
  description  = "My VPC Security Group"
ingress {
    cidr_blocks = "${var.ingressCIDRblock}"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
tags = {
        Name = "My VPC Security Group"
  }
} # end resource

resource "aws_security_group" "ingress-all-test" {
name = "allow-all-sg"
vpc_id = "${aws_vpc.My_VPC.id}"
ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
from_port = 22
    to_port = 22
    protocol = "tcp"
  }
// Terraform removes the default rule
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }

}

### Creating Security Group for EC2
resource "aws_security_group" "instance" {
  vpc_id       = "${aws_vpc.My_VPC.id}"
  name = "terraform-example-instance"
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

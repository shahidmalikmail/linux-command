# Create the Security Group
resource "aws_security_group" "freeshop_public_sg" {
  vpc_id       = "${aws_vpc.freeshop_VPC.id}"
  name         = "Freeshop VPC Security Group"
  description  = "Freeshop VPC Security Group"
ingress {
    cidr_blocks = "${var.ingressCIDRblock}"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
tags = {
        Name = "Freeshop VPC Security Group"
  }
} # end resource

resource "aws_security_group" "freeshop" {
name = "allow-all-sg"
vpc_id = "${aws_vpc.freeshop_VPC.id}"
ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
from_port = 22
    to_port = 22
    protocol = "tcp"
  }
// Terraform removes the default rule
  ingress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }

}

### Creating Security Group for EC2
resource "aws_security_group" "freeshop-" {
  vpc_id       = "${aws_vpc.freeshop_VPC.id}"
  name = "terraform-freeshop-instance"
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

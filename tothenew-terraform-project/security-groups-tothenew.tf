resource "aws_security_group" "tothenew_sg" {
  name = "tothenew_sg"
  description = "Docker_host Security Group"
  vpc_id      = "${aws_vpc.tothenew_vpc.id}"
tags {
    Name = "Tothenew-SG"
  }

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

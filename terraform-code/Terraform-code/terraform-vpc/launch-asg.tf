## Creating Launch Configuration
resource "aws_launch_configuration" "example" {
  image_id               = "${var.ami_id}"
  instance_type            = "t2.micro"
  security_groups        = ["${aws_security_group.instance.id}"]
  key_name               = "${var.key_name}"
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  lifecycle {
    create_before_destroy = true
  }
}
## Creating AutoScaling Group
resource "aws_autoscaling_group" "example" {
  launch_configuration = "${aws_launch_configuration.example.id}"
  availability_zones = ["${var.availability_zone}"]
  vpc_zone_identifier = ["${aws_subnet.My_VPC_Subnet.id}"]
  min_size = 2
  max_size = 5
//  load_balancers = ["${aws_elb.example.name}"]
  health_check_type = "EC2"
  tag {
    key = "Name"
    value = "terraform-asg-example"
    propagate_at_launch = true
  }
}

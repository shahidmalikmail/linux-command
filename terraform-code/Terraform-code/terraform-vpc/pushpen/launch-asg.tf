## Creating Launch Configuration
resource "aws_launch_configuration" "freeshop" {
  image_id               = "${var.ami_id}"
  instance_type            = "${var.instance_type}"
  security_groups        = ["${aws_security_group.freeshop_public_sg.id}"]
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
resource "aws_autoscaling_group" "freeshop" {
  launch_configuration = "${aws_launch_configuration.freeshop.id}"
  availability_zones = ["${var.availability_zone}"]
  vpc_zone_identifier = ["${aws_subnet.freeshop_public_subnet.id}"]
  min_size = 2
  max_size = 5
//  load_balancers = ["${aws_elb.freeshop.name}"]
  health_check_type = "EC2"
  tag {
    key = "Name"
    value = "Freeshop-Instance"
    propagate_at_launch = true
  }
}

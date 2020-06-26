resource "aws_instance" "webservers" {
	count = "${length(var.subnets_cidr)}" 
	ami = "${var.webservers_ami}"
	instance_type = "${var.instance_type}"
	security_groups = ["${aws_security_group.web-node.id}"]
	subnet_id = "${element(aws_subnet.public.*.id,count.index)}"
	key_name = "${var.key_name}"
	## user_data = "${file("install_httpd.sh")}"

	tags {
	  Name = "Server-${count.index}"
	}
}
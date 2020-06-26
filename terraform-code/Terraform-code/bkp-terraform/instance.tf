resource "aws_instance" "application_server" {
ami	= "${var.ami_id}"
instance_type = "${var.instance_type}"
count	= "${var.count}"
subnet_id	= "${var.subnet_id}"
vpc_security_group_ids	= ["${var.security_group}"]
key_name	= "${var.key_name}"

root_block_device {
	volume_type	= "${var.volume_type}"
	volume_size	= "${var.volume_size}"
	delete_on_termination	= "true"
	
}

lifecycle {
	create_before_destroy = true
}

tags {
	Name = "App-SVR"
	Environment = "Development"
	Project = "Personal-Work"
	Provisioner = "Terraform"
	
}

}



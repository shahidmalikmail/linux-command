# Ec2 Instances Creating.
resource "aws_instance" "docker_host" {
    ami = "${var.docker_host_ami}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    subnet_id = "${element(aws_subnet.tothenew_subnet.*.id,count.index)}"
    count = "${var.count}"
    associate_public_ip_address = "true"
    vpc_security_group_ids = ["${aws_security_group.tothenew_sg.id}"]
    user_data = "${file("user-data-tothenew.sh")}"

    tags {
        Name = "Docker-Host-${count.index+1}"
    }


}
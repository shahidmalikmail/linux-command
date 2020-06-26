### Creating ELB
//resource "aws_elb" "example" {
//  name = "terraform-asg-example"
// security_groups = ["${aws_security_group.My_VPC_Security_Group.id}"]
 #subnets = ["subnet-08f8d0577d19831a4", "subnet-0ae127922441b26cc"]
 # availability_zones = ["ap-south-1a", "ap-south-1b"]

  #health_check {
  #  healthy_threshold = 2
   # unhealthy_threshold = 2
   # timeout = 3
   # interval = 30
   # target = "HTTP:8080/"
  #}
  #listener {
  #  lb_port = 80
  #  lb_protocol = "http"
  #  instance_port = "8080"
  #  instance_protocol = "http"
  #}
#}

##################################################
resource "aws_alb" "kms-report-lb" {
    name                = "kms-report-lb"
    security_groups     = ["${aws_security_group.My_VPC_Security_Group.id}"]
    subnets             = ["subnet-08f8d0577d19831a4", "subnet-0ae127922441b26cc"]
//    availability_zones = ["ap-south-1a", "ap-south-1b"]

    tags {
      Name = "kms-report-lb"
     Project = "kms"
     Env    = "uat" 
    }
}

resource "aws_alb_target_group" "kms-report-tg" {
    name                = "kms-report-tg"
    port                = "8080"
    protocol            = "HTTP"
    vpc_id              = "${aws_vpc.My_VPC.id}"

    health_check {
        healthy_threshold   = "5"
        unhealthy_threshold = "2"
        interval            = "30"
        matcher             = "200"
        path                = "/"
        port                = "traffic-port"
        protocol            = "HTTP"
        timeout             = "5"
    }

    tags {
      Name = "kms-report-tg"
    }
}

resource "aws_alb_listener" "alb-listener" {
    load_balancer_arn = "${aws_alb.kms-report-lb.arn}"
    port              = "8080"
    protocol          = "HTTP"

    default_action {
        target_group_arn = "${aws_alb_target_group.kms-report-tg.arn}"
        type             = "forward"
    }
}


##################################################
resource "aws_alb" "freeshop-lb" {
    name                = "freeshop-lb"
    security_groups     = ["${aws_security_group.freeshop_public_sg.id}"]
    subnets             = ["subnet-0d0c9a6d9d000fe22","subnet-0e114ea41af3151fe"]


    tags {
      Name = "freeshop-lb"
     Project = "free shopping"
     Env    = "uat" 
    }
}

resource "aws_alb_target_group" "freeshop-tg" {
    name                = "freeshop-tg"
    port                = "8080"
    protocol            = "HTTP"
    vpc_id              = "${aws_vpc.freeshop_VPC.id}"

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
      Name = "freeshop-tg"
    }
}

resource "aws_alb_listener" "alb-listener" {
    load_balancer_arn = "${aws_alb.freeshop-lb.arn}"
    port              = "8080"
    protocol          = "HTTP"

    default_action {
        target_group_arn = "${aws_alb_target_group.freeshop-tg.arn}"
        type             = "forward"
    }
}


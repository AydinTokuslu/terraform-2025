resource "aws_lb" "phonebook-lb" {
  name               = "phonebook-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-secgrp.id]
  subnets            = data.aws_subnets.default.ids
  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "phonebook-listener" {
  load_balancer_arn = aws_lb.phonebook-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.phonebook-tg.arn
  }
}

resource "aws_lb_target_group" "phonebook-tg" {
  name        = "phonebook-targetgroup"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = data.aws_vpc.default.id
  target_type = "instance"
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 10
    matcher             = 200
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 3
    unhealthy_threshold = 3
  }
}


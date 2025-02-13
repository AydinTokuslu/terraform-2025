# resource "aws_lb" "phonebook-lb" {
#   name               = "phonebook-lb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.alb-secgrp.id]
  

#   enable_deletion_protection = true

#   access_logs {
#     bucket  = aws_s3_bucket.lb_logs.id
#     prefix  = "test-lb"
#     enabled = true
#   }

#   tags = {
#     Environment = "production"
#   }
# }

# Terraform AWS Application Load Balancer (ALB)
module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "5.16.0"

  name = "phonebook-alb"
  load_balancer_type = "application"
  vpc_id = module.vpc.vpc_id
  subnets = [
    module.vpc.public_subnets[0],
    module.vpc.public_subnets[1]
  ]
  #security_groups = [module.loadbalancer_sg.this_security_group_id]
  security_groups = [ aws_security_group.alb-secgrp.id ]
  # Listeners
    http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]  
  # Target Groups
  target_groups = [
    # App1 Target Group
    {
      name_prefix      = "app1-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 2
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }      
      protocol_version = "HTTP1"
      # App1 Target Group - Targets
      targets = {
        my_app1_vm1 = {
          target_id = module.ec2_private.id[0]
          port      = 80
        },
        my_app1_vm2 = {
          target_id = module.ec2_private.id[1]
          port      = 80
        }        
      }
      tags = phonebook-tg # Target Group Tags
    }     
  ]
  tags = phonebook-alb # ALB Tags
}

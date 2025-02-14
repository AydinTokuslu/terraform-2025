# Autoscaling Group Resource
resource "aws_autoscaling_group" "phonebook_asg" {
  name_prefix = "phonebook_asg"
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1
  
  vpc_zone_identifier  = aws_lb.phonebook-lb.subnets

  target_group_arns         = [aws_lb_target_group.phonebook-tg.arn]
  health_check_type         = "ELB"
  health_check_grace_period = 90 # default is 300 seconds  
  # Launch Template
  launch_template {
    id      = aws_launch_template.my_launch_template.id
    version = aws_launch_template.my_launch_template.latest_version
  }
      
}

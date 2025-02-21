# Autoscaling Group Resource
resource "aws_autoscaling_group" "phonebook_asg" {
  name_prefix = "phonebook_asg"
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1
  
  vpc_zone_identifier  = aws_lb.phonebook-lb.subnets

  target_group_arns         = [aws_lb_target_group.phonebook-tg.arn]
  health_check_type         = "ELB"
  health_check_grace_period = 300 # default is 300 seconds  
  # Launch Template
  launch_template {
    id      = aws_launch_template.my_launch_template.id
    version = aws_launch_template.my_launch_template.latest_version
  }
}



data "aws_route53_zone" "selected" {
  name = var.hosted-zone
}



resource "aws_route53_record" "phonebook" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name = "phonebook.${var.hosted-zone}"
  type = "A"
  alias {
    name = aws_lb.phonebook-lb.dns_name
    zone_id = aws_lb.phonebook-lb.zone_id
    evaluate_target_health = true
  }
}

# Terraform AWS Application Load Balancer (ALB) Outputs

output "this_lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = "http://${aws_lb.phonebook-lb.dns_name}"
}


output "db_endpoint" {
  value = aws_db_instance.my-database-server.endpoint
  description = "The database endpoint"
}


# Terraform AWS Application Load Balancer (ALB) Outputs

output "this_lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = "http://${aws_lb.phonebook-lb.dns_name}"
}


output "rds_endpoint" {
  description = "The database endpoint"
  value = aws_db_instance.my-database-server.endpoint
  
}

output "rds_address" {
  description = "The database address"
  value = aws_db_instance.my-database-server.address
}

# output "rds_address_2" {
#   description = "The database address_2"
#   value = aws_db_instance.my-database-server.endpoint.address
# }


output "websiteurl" {
    value = aws_route53_record.phonebook.name
}


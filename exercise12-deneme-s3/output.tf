# Terraform  Outputs


output "s3_bucket_id" {

  #value = "http://${aws_s3_bucket_website_configuration.blog.website_endpoint}"
  value = "http://${aws_s3_bucket.static_website.id}.s3-website-us-east-1.amazonaws.com "

}

# output "cloudfront_distribution_domain_name" {
#   value = aws_cloudfront_distribution.s3_distribution.domain_name
# }

# output "websiteurl" {
#     value = aws_route53_record.kittens.name
# }

# output "domain_name" {
#   value = var.domain
# }


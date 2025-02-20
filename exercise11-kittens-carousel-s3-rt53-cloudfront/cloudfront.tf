
resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.bucket.bucket_regional_domain_name
    origin_id   = "S3Origin"
    custom_origin_config {
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"]
      http_port              = 80
      https_port             = 443
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  http_version        = "http2"
  default_root_object = "index.html"

  logging_config {
    include_cookies = false
    bucket          = "${var.domain}.s3.amazonaws.com"
    prefix          = "cloudfront_logs"
  }

  aliases = [var.domain]

  default_cache_behavior {
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "S3Origin"

    forwarded_values {
      query_string = true

      cookies {
        forward = "none"
      }
    }
  }

  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }


#     viewer_certificate {
#       cloudfront_default_certificate = false
#       acm_certificate_arn = data.aws_acm_certificate.issued.id
#       minimum_protocol_version = "TLSv1.1_2016"
#       ssl_support_method = "sni-only"
#   }

    viewer_certificate {
        #cloudfront_default_certificate = true
        acm_certificate_arn = "arn:aws:acm:us-east-1:600627361541:certificate/0c6d032e-b610-46ea-a9e6-ec0d0f39dccc"
        ssl_support_method  = "sni-only"
    }

}

# data "aws_acm_certificate" "issued" {
#   domain   = "*.devopsaydintokuslu.de"
#   #statuses = ["ISSUED"]
#   #provider = aws.virginia
# }
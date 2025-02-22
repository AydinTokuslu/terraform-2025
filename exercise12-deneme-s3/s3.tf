

resource "aws_s3_bucket" "static_website" {
  bucket = var.bucket_name  # Kendi unique bucket isminizi kullanın
}

resource "aws_s3_bucket_website_configuration" "static_website" {
  bucket = aws_s3_bucket.static_website.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.static_website.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::kittens-carousel-bucket44/*"
    }
  ]
}
POLICY
}

resource "aws_s3_bucket_acl" "static_website_acl" {
  bucket = aws_s3_bucket.static_website.id
  acl    = "public-read"
}

resource "aws_s3_object" "website_files" {
  for_each = fileset("./website", "*")

  bucket = aws_s3_bucket.static_website.id
  key    = each.value
  source = "./website/${each.value}"
  acl    = "public-read"
  content_type = lookup({
    "html" = "text/html",
    "css"  = "text/css",
    "js"   = "application/javascript",
    "jpg"  = "image/jpeg"
  }, split(".", each.value)[length(split(".", each.value)) - 1], "application/octet-stream")
}

output "website_url" {
  value = aws_s3_bucket_website_configuration.static_website.website_endpoint
}

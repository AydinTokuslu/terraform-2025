

resource "aws_s3_bucket" "static_website" {
  bucket = "kittens.devopsaydintokuslu.de"  # Kendi unique bucket isminizi kullanın
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_website_configuration" "static_website" {
  bucket = aws_s3_bucket.static_website.id

  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "static_website" {
  bucket = aws_s3_bucket.static_website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.static_website.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "arn:aws:s3:::kittens.devopsaydintokuslu.de/*"
      }
    ]
  })
}


resource "aws_s3_object" "website_files" {
  for_each = fileset("./website", "*")

  bucket = aws_s3_bucket.static_website.id
  key    = each.value
  source = "./website/${each.value}"
  content_type = lookup({
    "html" = "text/html",
    "css"  = "text/css",
    "js"   = "application/javascript",
    "jpg"  = "image/jpeg"
  }, split(".", each.value)[length(split(".", each.value)) - 1], "application/octet-stream")
}

output "website_url" {
  value = "http://${aws_s3_bucket.static_website.bucket}.s3-website-us-east-1.amazonaws.com"
}
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "blog" {
  bucket = aws_s3_bucket.bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_object" "upload_object" {
  for_each      = fileset("static-web/", "*")
  bucket        = aws_s3_bucket.bucket.id
  key           = each.value
  source        = "static-web/${each.value}"
  etag          = filemd5("static-web/${each.value}")
  #content_type  = "text/html, image/jpeg"
  #acl = "public-read"
}

resource "aws_s3_bucket_ownership_controls" "state_store" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  depends_on = [aws_s3_bucket.bucket]
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "MYBUCKETPOLICY",
    Statement = [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${aws_s3_bucket.bucket.id}/*"
        }
    ]
}
  )
} 
# resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
#   bucket = aws_s3_bucket.bucket.id
#   policy = data.aws_iam_policy_document.allow_access_from_another_account.json
# }

# data "aws_iam_policy_document" "allow_access_from_another_account" {
#   statement {
#     principals {
#       type        = "AWS"
#       identifiers = ["600627361541"]
#     }

    
#     actions = [
#       "s3:GetObject",
#     ]

#     resources = [
#       "${aws_s3_bucket.bucket.arn}/*",
#     ]
#   }
# }
provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.57.0"
    }
  }
}

variable "num_of_buckets" {
  default = 0
}

variable "s3_bucket" {
  default = "aydin-new-s3-bucket"
}

variable "users" {
  default = ["santino", "michael", "fredo"]
}

resource "aws_s3_bucket" "tf-s3" {
  # bucket = "var.s3_bucket_name.${count.index}"
  # count = var.num_of_buckets
  # count = var.num_of_buckets != 0 ? var.num_of_buckets : 1
  for_each = toset(var.users)
  bucket   = "${each.value}-tf-s3-bucket"
}

resource "aws_iam_user" "new_users" {
  for_each = toset(var.users)
  name = each.value
}

output "uppercase_users" {
  value = [for user in var.users : upper(user) if length(user) > 6]
}



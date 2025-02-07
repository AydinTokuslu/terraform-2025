provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.57.0"
    }
  }
}

locals {
  mytag = "aydin-local-name"
}

resource "aws_instance" "tf-ec2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  key_name      = "mykey" # write your pem file without .pem extension>
  tags = {
    "Name" = "${local.mytag}-come-from-locals"
  }
}

resource "aws_s3_bucket" "tf-s3" {
  bucket = var.s3_bucket_name
  tags = {
    Name = "${local.mytag}-come-from-locals"
  }
}

output "tf_example_public_ip" {
  value = aws_instance.tf-ec2.public_ip
}

output "tf_example_s3_meta" {
  value = aws_s3_bucket.tf-s3.region
}
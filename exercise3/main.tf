provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.72.1"
    }
  }
  backend "s3" {
    bucket = "aydin-tf-remote-s3-bucket-clarusways"
    key = "env/dev/tf-remote-backend.tfstate"
    region = "us-east-1"
    dynamodb_table = "tf-s3-state-lock"
    encrypt = true
  }
}

locals {
  mytag = "clarusway-local-name"
}

variable "ec2_type" {
  default = "t2.micro"
}

data "aws_ami" "tf-ami" {
  most_recent = true
  owners = [ "self" ]
  
  filter {
   name =  "virtualization-type"
   values = [ "hvm" ]
  }
}

resource "aws_instance" "tf-ec2" {
  ami = data.aws_ami.tf-ami.id
  instance_type = var.ec2_type
  key_name = "mykey"
  tags = {
    Name = "${local.mytag}-this is from my-ami"
  }
}

resource "aws_s3_bucket" "tf-test-1" {
  bucket = "clarusway-test-1-versioning-44"
}

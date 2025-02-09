terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.49.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

import {
  to = aws_instance.example
  id = "i-0827bda3a00cbb232"
}

resource "aws_instance" "example" {
  ami = "ami-085ad6ae776d8f09c"
  instance_type = "t2.micro"
  key_name = "mykey"
}
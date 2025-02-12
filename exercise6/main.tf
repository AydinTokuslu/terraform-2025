terraform {
  #required_version = "~> 0.14" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_version = ">= 1.6.0" 
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = ">= 4.65"
      version = ">= 5.31"
    }
  } 
}  
# Provider Block
provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "myec2vm" {
  ami = "ami-085ad6ae776d8f09c"
  instance_type = "t2.micro"
  user_data = file("${path.module}/apache-install.sh")
  tags = {
    "Name" = "EC2 Demo"
  }
}


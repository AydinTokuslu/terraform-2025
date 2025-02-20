variable "aws_region" {
  description = "region in which AWS Resources to be created"
  type = string
  default = "us-east-1"
}

variable "instance_type" {
  description = "EC2 Instance type"
  type = string
  default = "t2.micro"
}

variable "instance_keypair" {
  description = "keypair for ssh connection"
  type = string
  default = "mykey"
}

variable "bucket_name" {
  type = string
  description = "Name of the bucket."
  default = "kittens.devopsaydintokuslu.de"
}

variable "hosted-zone" {
  default = "devopsaydintokuslu.de."
}

variable "domain" {
  default = "kittens.devopsaydintokuslu.de"
  type    = string
}



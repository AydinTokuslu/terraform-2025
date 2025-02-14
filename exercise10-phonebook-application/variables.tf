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

variable "db_subnet_a_us_east_1a_id" {
  description = "Subnet ID for database in us-east-1a"
  type        = string
}

variable "db_subnet_b_us_east_1b_id" {
  description = "Subnet ID for database in us-east-1b"
  type        = string
}


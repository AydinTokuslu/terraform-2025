variable "ec2_name" {
  default = "aydin-ec2"
}

variable "ec2_type" {
  default = "t2.micro"
}

variable "ec2_ami" {
  default = "ami-0ed9277fb7eb570c9"
}

variable "s3_bucket_name" {
  default = "aydin-tf-test-bucket"
}
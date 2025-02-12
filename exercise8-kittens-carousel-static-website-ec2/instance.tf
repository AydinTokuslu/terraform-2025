resource "aws_instance" "tf-ec2" {
  ami                     = data.aws_ami.linux2.id
  instance_type           = var.instance_type
  key_name = var.instance_keypair
  user_data = file("${path.module}/userdata.sh")
  vpc_security_group_ids = [ aws_security_group.kittens-secgrp.id ]
  tags = {
    Name = "kittens-carousel"
  }
}
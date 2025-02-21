# Launch Template Resource
resource "aws_launch_template" "my_launch_template" {
  name = "my-launch-template"
  description = "My Launch Template"
  image_id = data.aws_ami.linux2.id
  instance_type = var.instance_type

  #depends_on = [aws_db_instance.my-database-server] # Önce DB oluşsun
  depends_on = [github_repository_file.dbendpoint]
  vpc_security_group_ids = [ aws_security_group.webserver-secgrp.id ]
  key_name = var.instance_keypair
  user_data = filebase64("${path.module}/userdata.sh")
  #user_data = templatefile("${path.module}/userdata.sh", { rds_endpoint = "${var.rds_endpoint}" })
  

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "my launch template"
    }
  }
}






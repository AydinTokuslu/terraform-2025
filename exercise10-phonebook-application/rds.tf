module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "aydin-db2"

  engine            = "mysql"
  engine_version    = "8.0.35"
  instance_class    = "db.t2.micro"
  allocated_storage = 20
  max_allocated_storage = 20

  db_name  = "clarusway_phonebook"
  username = "admin"
  password = "awsdevops13"
  port     = "3306"

  publicly_accessible = true

  vpc_security_group_ids = [ aws_security_group.db-secgrp.id ]

}

resource "aws_security_group" "db-secgrp" {
  name        = "db-secgrp"
  description = "Allow TLS inbound traffic"
  
  ingress {
    description = "allow port 3306"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [ aws_security_group.webserver-secgrp.id ]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db-secgrp"
  }
}
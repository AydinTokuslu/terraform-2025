#!/bin/bash
yum update -y
yum install python3 -y
pip3 install flask
pip3 install flask_mysql
yum install git -y
              
# Uygulamayı GitHub'dan çek
cd /home/ec2-user

#echo "${aws_db_instance.my-database-server.endpoint}" > /home/ec2-user/dbserver.endpoint

git clone https://github.com/AydinTokuslu/contact-list-project.git

python3 /home/ec2-user/contact-list-project/contact-list-app.py
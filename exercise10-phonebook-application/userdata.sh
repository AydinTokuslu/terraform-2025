#!/bin/bash
yum update -y
yum install python3 -y
pip3 install flask
pip3 install flask_mysql
yum install git -y
              
# Uygulamayı GitHub'dan çek
cd /home/ec2-user

echo "${aws_db_instance.my-database-server.endpoint}" > /home/ec2-user/dbserver.endpoint

git clone https://github.com/AydinTokuslu/contact-list-project.git
cd contact-list-project
              
# RDS bağlantısı için environment variable ekleyin
# echo "export DATABASE_HOST='${aws_db_instance.my-database-server.endpoint}'" >> ~/.bashrc
# echo "export DATABASE_USER='${aws_db_instance.my-database-server.username}'" >> ~/.bashrc
# echo "export DATABASE_PASSWORD='${aws_db_instance.my-database-server.password}'" >> ~/.bashrc
# echo "export DATABASE_NAME='${aws_db_instance.my-database-server.db_name}'" >> ~/.bashrc
# source ~/.bashrc
              
# Flask uygulamasını çalıştır
#python3 contact-list-app.py &
python3 /home/ec2-user/contact-list-project/contact-list-app.py
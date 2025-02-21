#!/bin/bash
yum update -y
yum install python3 -y
pip3 install flask
pip3 install flask_mysql
yum install git -y
cd /home/ec2-user
FOLDER="https://raw.githubusercontent.com/AydinTokuslu/contact-list-project/refs/heads/main"
wget ${FOLDER}/contact-list-app.py
mkdir templates && cd templates
wget ${FOLDER}/templates/index.html
wget ${FOLDER}/templates/add-update.html
wget ${FOLDER}/templates/delete.html
cd ..

echo "${aws_db_instance.my-database-server.endpoint}" > /home/ec2-user/dbserver.endpoint
python3 /home/ec2-user/contact-list-app.py
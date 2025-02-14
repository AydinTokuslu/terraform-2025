#! /bin/bash
yum update -y
yum install python3 -y
pip3 install flask
pip3 install flask_mysql
yum install git -y
#echo "${MyDBURI}" > /home/ec2-user/dbserver.endpoint
echo "Database Endpoint: ${MyDBURI}" > /home/ec2-user/dbserver.endpoint
cd /home/ec2-user
FOLDER="https://raw.githubusercontent.com/AydinTokuslu/my-projects/refs/heads/main/aws/Project-004-Phonebook-Application"
wget ${FOLDER}/phonebook-app.py
mkdir templates && cd templates
wget ${FOLDER}/templates/index.html
wget ${FOLDER}/templates/add-update.html
wget ${FOLDER}/templates/delete.html
cd ..
python3 phonebook-app.py
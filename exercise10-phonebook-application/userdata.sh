#! /bin/bash
yum update -y
yum install python3 -y
pip3 install flask
pip3 install flask_mysql
yum install git -y
echo "${MyDBURI}" > /home/ec2-user/dbserver.endpoint
cd /home/ec2-user
FOLDER="https://raw.githubusercontent.com/AydinTokuslu/my-projects/refs/heads/main/aws/Project-004-Phonebook-Application"
wget ${FOLDER}/phonebook-app.py
mkdir templates && cd templates
wget ${FOLDER}/templates/index.html
wget ${FOLDER}/templates/add-update.html
wget ${FOLDER}/templates/delete.html
cd ..
python3 phonebook-app.py


##! /bin/bash
# yum update -y
# yum install python3 -y
# pip3 install flask
# pip3 install flask_mysql
# echo "${MyDBURI}" > /home/ec2-user/dbserver.endpoint
# TOKEN="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"
# FOLDER="https://$TOKEN@raw.githubusercontent.com/AydinTokuslu/private-my-projects/main/Project-004-Phonebook-Application"
# curl -s --create-dirs -o "/home/ec2-user/templates/index.html" -L "$FOLDER"/templates/index.html
# curl -s --create-dirs -o "/home/ec2-user/templates/add-update.html" -L "$FOLDER"/templates/add-update.html
# curl -s --create-dirs -o "/home/ec2-user/templates/delete.html" -L "$FOLDER"/templates/delete.html
# curl -s --create-dirs -o "/home/ec2-user/phonebook-app.py" -L "$FOLDER"/phonebook-app.py
# python3 /home/ec2-user/phonebook-app.py





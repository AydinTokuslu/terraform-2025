# #! /bin/bash
# yum update -y
# yum install python3 -y
# pip3 install flask
# pip3 install flask_mysql
# yum install git -y
# #echo "${MyDBURI}" > /home/ec2-user/dbserver.endpoint
# echo "Database Endpoint: ${MyDBURI}" > /home/ec2-user/dbserver.endpoint
# cd /home/ec2-user
# FOLDER="https://raw.githubusercontent.com/AydinTokuslu/my-projects/refs/heads/main/aws/Project-004-Phonebook-Application"
# wget ${FOLDER}/phonebook-app.py
# mkdir templates && cd templates
# wget ${FOLDER}/templates/index.html
# wget ${FOLDER}/templates/add-update.html
# wget ${FOLDER}/templates/delete.html
# cd ..
# python3 phonebook-app.py


#! /bin/bash
# yum update -y
# yum install python3 -y
# yum install git -y
# pip3 install flask
# pip3 install flask_mysql
# echo "${MyDBURI}" > /home/ec2-user/dbserver.endpoint
# cd /home/ec2-user
# git clone https://github.com/AydinTokuslu/contact-list-project.git
# cd contact-list-project/
# python3 contact-list-app.py
# MyDBURI: !GetAtt aws_db_instance.my-database-server.endpoint

# #! /bin/bash
# yum update -y
# yum install python3 -y
# pip3 install flask
# pip3 install flask_mysql
# echo "${MyDBURI}" > /home/ec2-user/dbserver.endpoint
# TOKEN="XXXXXXXXXXXXXXXXXXXXXXXX"
# #FOLDER="https://$TOKEN@raw.githubusercontent.com/AydinTokuslu/private-my-projects/main/Project-004-Phonebook-Application"
# FOLDER="https://$TOKEN@raw.githubusercontent.com/AydinTokuslu/my-private-aws-project/main/Project-004-Phonebook-Application"
# curl -s --create-dirs -o "/home/ec2-user/templates/index.html" -L "$FOLDER"/templates/index.html
# curl -s --create-dirs -o "/home/ec2-user/templates/add-update.html" -L "$FOLDER"/templates/add-update.html
# curl -s --create-dirs -o "/home/ec2-user/templates/delete.html" -L "$FOLDER"/templates/delete.html
# curl -s --create-dirs -o "/home/ec2-user/phonebook-app.py" -L "$FOLDER"/phonebook-app.py
# python3 /home/ec2-user/phonebook-app.py

# cd /home/ec2-user/
# TOKEN=$(aws --region=us-east-1 ssm get-parameter --name /aydin/capstone/token --with-decryption --query 'Parameter.Value' --output text)
# #git clone https://$TOKEN@<YOUR PRIVATE REPO URL>
# git clone https://$TOKEN@github.com/AydinTokuslu/aws-capstone.git
# cd /home/ec2-user/contact-list-project

# #! /bin/bash
# yum update -y
# yum install -y python3 git 
# pip3 install flask flask_mysql
# # Veritabanı bağlantı noktasını kaydet
# echo "${aws_db_instance.my-database-server.endpoint}" > /home/ec2-user/dbserver.endpoint
# # Uygulama dizinine gidip projeyi klonla
# cd /home/ec2-user
# git clone https://github.com/AydinTokuslu/contact-list-project.git
# cd contact-list-project/
# # Flask uygulamasını arka planda çalıştır
# nohup python3 contact-list-app.py > app.log 2>&1 &



# terraform apply -var="rds_endpoint=$(terraform output -raw rds_endpoint)"

# user_data = base64encode(<<EOF
# #!/bin/bash
# yum update -y
# yum install -y python3 git 
# pip3 install flask flask_mysql
# echo "DEBUG: rds_endpoint=${var.rds_endpoint}" >> /var/log/userdata.log
# # RDS endpoint değerini güvenli şekilde al ve kaydet
# echo "$(cat <<EOF2
# ${var.rds_endpoint}
# EOF2
# )" > /home/ec2-user/dbserver.endpoint
# # Dosyanin içeriğini loga yaz
# cat /home/ec2-user/dbserver.endpoint >> /var/log/userdata.log
# # Uygulama dizinine gidip projeyi klonla
# cd /home/ec2-user
# git clone https://github.com/AydinTokuslu/contact-list-project.git
# cd contact-list-project/
# # Flask uygulamasini arka planda calistir
# nohup python3 contact-list-app.py > app.log 2>&1 &
# EOF
#   )

# #! /bin/bash
# yum update -y
# yum install python3 -y
# pip3 install flask
# pip3 install flask_mysql
# yum install git -y
# #echo "${MyDBURI}" > /home/ec2-user/dbserver.endpoint
# #echo "Database Endpoint: ${MyDBURI}" > /home/ec2-user/dbserver.endpoint
# #echo "Database Endpoint: ${var.rds_endpoint}" > /home/ec2-user/dbserver.endpoint
# cd /home/ec2-user
# FOLDER="https://raw.githubusercontent.com/AydinTokuslu/contact-list-project/refs/heads/main"
# wget ${FOLDER}/contact-list-app.py
# mkdir templates && cd templates
# wget ${FOLDER}/templates/index.html
# wget ${FOLDER}/templates/add-update.html
# wget ${FOLDER}/templates/delete.html
# cd ..
# echo "$(cat ${var.rds_endpoint} )" > /home/ec2-user/dbserver.endpoint
# python3 contact-list-app.py

# #! /bin/bash
# yum update -y
# yum install python3 -y
# pip3 install flask
# pip3 install flask_mysql
# yum install git -y
# TOKEN=${user-data-git-token}
# USER=${user-data-git-name}
# cd /home/ec2-user && git clone https://$TOKEN@github.com/$USER/phonebook.git
# python3 /home/ec2-user/phonebook/phonebook-app.py
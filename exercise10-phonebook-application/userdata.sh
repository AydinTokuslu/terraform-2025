#! /bin/bash
yum update -y
yum install -y python3 git 
pip3 install flask flask_mysql

# Veritabanı bağlantı noktasını kaydet
echo "${db_endpoint}" > /home/ec2-user/dbserver.endpoint

# Uygulama dizinine gidip projeyi klonla
cd /home/ec2-user
git clone https://github.com/AydinTokuslu/contact-list-project.git
cd contact-list-project

# Flask uygulamasını arka planda çalıştır
nohup python3 contact-list-app.py > app.log 2>&1 &




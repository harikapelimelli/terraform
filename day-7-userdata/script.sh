#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo service httpd start
sudo systemctl enable httpd
echo "<h1>welcome to naresh IT!  AWS Infra created using terraform in us-east-1 region</h1>" > /var/www/html/index.html
#git install
sudo yum install git -y
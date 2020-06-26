#!/bin/bash
sudo apt-get -y update
sudo apt-get install -y nginx
#sudo chkconfig httpd on
sudo service nginx start
echo "<h1>Deployed via Terraform wih ELB</h1>" | sudo tee /var/www/html/index.html
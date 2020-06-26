#! /bin/bash
sudo apt-get update -y
sudo apt-get install nginx -y
sudo service nginx start
sudo service nginx enable
echo "<h1>Deployed via Terraform wih ELB</h1>" | sudo tee /var/www/html/index.html
sudo service nginx restart

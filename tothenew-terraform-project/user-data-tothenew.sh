#!/bin/bash
sudo apt update -y
sudo apt install docker -y
sudo apt install docker-compose -y
cat << EOF > /home/ubuntu/docker-compose.yml
version: '3.3'
services:
   db:
    image: mysql:5.7
    volumes:
        - db_data:/var/lib/mysql
    restart: always
    environment:
        MYSQL_ROOT_PASSWORD: tothenew@2020
        MYSQL_DATABASE: tothenewdb
        MYSQL_USER: tothenew
        MYSQL_PASSWORD: tothenew@2021

   wordpress:
        depends_on:
            - db
        image: wordpress:latest
        volumes:
          - wordpress:/var/lib/wordpress
        ports:
            - "80:80"
        restart: always
        environment:
         WORDPRESS_DB_HOST: db:3306
         WORDPRESS_DB_USER: tothenew
         WORDPRESS_DB_PASSWORD: tothenew@2021
         WORDPRESS_DB_NAME: tothenewdb

volumes:
    db_data: {}
    wordpress: {}

EOF
sudo docker-compose -f /home/ubuntu/docker-compose.yml up -d
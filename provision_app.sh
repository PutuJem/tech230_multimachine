#!/bin/bash

sudo apt-get update -y

sudo apt-get upgrade -y

sudo apt-get install nginx -y

sudo systemctl start nginx -y

# install application dependant Node packages

sudo apt-get install python-software-properties -y

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - # change from version 6 to 12

sudo apt-get install nodejs -y

sudo npm install pm2 -g

# install npm, within the app directory, and run the application

# cd app

# cd app

# npm install

# node app.js


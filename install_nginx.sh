#!/bin/bash

# Update and Upgrade the system
sudo apt-get upgrade -y && sudo apt-get update -y

# Install Nginx
sudo apt-get install nginx -y

# Start Nginx service
sudo systemctl start nginx

# Enable Nginx to start on boot
sudo systemctl enable nginx

# change the default nginx page
echo "<h1>Welcome to Terraform Web Server</h1>" | sudo tee /var/www/html/index.html
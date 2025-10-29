#!/bin/bash
sudo apt update
sudo apt install -y apache2
echo "<h1>Deployed via Terraform - $(hostname -f) </h1>" > /var/www/html/index.html
sudo systemctl restart apache2
#!/bin/bash
apt update -y
apt install nginx -y
systemctl enable nginx
systemctl start nginx

echo "<h1>Bienvenue sur la VM Frontend</h1><p>Déployé automatiquement avec Terraform.</p>" > /var/www/html/index.html
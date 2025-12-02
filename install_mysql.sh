#!/bin/bash
# Instalación y configuración de MySQL en Ubuntu 24.04

echo "Actualizando paquetes..."
sudo apt update && sudo apt upgrade -y

echo "Instalando MySQL Server..."
sudo apt install mysql-server -y

echo "Iniciando y habilitando el servicio MySQL..."
sudo systemctl start mysql
sudo systemctl enable mysql

echo "Configurando MySQL de forma segura..."
sudo mysql_secure_installation <<EOF

y
TestPass123!
TestPass123!
y
y
y
y
EOF

echo "Creando usuario y base de datos de prueba..."
sudo mysql -u root -pTestPass123! -e "CREATE DATABASE testdb;"
sudo mysql -u root -pTestPass123! -e "CREATE USER 'testuser'@'localhost' IDENTIFIED BY 'testpass';"
sudo mysql -u root -pTestPass123! -e "GRANT ALL PRIVILEGES ON testdb.* TO 'testuser'@'localhost';"
sudo mysql -u root -pTestPass123! -e "FLUSH PRIVILEGES;"

echo "MySQL instalado y configurado correctamente."

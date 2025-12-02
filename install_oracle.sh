#!/bin/bash
# Instalación de Oracle Database 21c XE en Ubuntu 24.04

echo "Actualizando paquetes..."
sudo apt update && sudo apt upgrade -y

echo "Instalando dependencias..."
sudo apt install alien libaio1 unixodbc -y

echo "Descargando Oracle Database 21c XE..."
wget -O oracle-xe.deb https://download.oracle.com/otn_software/linux/xe/21c/oracle-database-xe-21c-1.0-1.x86_64.deb

echo "Instalando Oracle XE..."
sudo dpkg -i oracle-xe.deb

echo "Configurando Oracle XE..."
sudo /etc/init.d/oracle-xe-21c configure <<EOF
# Contraseña para SYS y SYSTEM
Oracle123
# Puerto HTTP (por defecto 8080)
8080
# Puerto listener (por defecto 1521)
1521
# Memoria por defecto
y
EOF

echo "Oracle Database 21c XE instalado y configurado correctamente."
echo "Puedes conectarte con: sqlplus system/Oracle123@localhost:1521/XEPDB1"

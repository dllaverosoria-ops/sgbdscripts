#!/bin/bash
# Instalación y configuración de PostgreSQL en Ubuntu 24.04

echo "Actualizando paquetes..."
sudo apt update && sudo apt upgrade -y

echo "Instalando PostgreSQL..."
sudo apt install postgresql postgresql-contrib -y

echo "Iniciando y habilitando PostgreSQL..."
sudo systemctl start postgresql
sudo systemctl enable postgresql

echo "Creando usuario y base de datos de prueba..."
sudo -i -u postgres psql <<EOF
CREATE USER testuser WITH PASSWORD 'testpass';
CREATE DATABASE testdb OWNER testuser;
\q
EOF

echo "PostgreSQL instalado y configurado correctamente."

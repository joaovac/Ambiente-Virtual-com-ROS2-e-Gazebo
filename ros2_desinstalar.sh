#!/bin/bash

# Desinstalar ROS2
sudo apt remove ~nros-iron-* -y && sudo apt autoremove -y

# Remover diretório
sudo rm /etc/apt/sources.list.d/ros2.list

# Atualizar lista de pacotes
sudo apt update -y

# Remover pacotes não utilizados
sudo apt autoremove -y

# Atualizar pacotes restantes
sudo apt upgrade -y

echo "Desinstalação completa."


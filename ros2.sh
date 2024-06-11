#!/bin/bash

# Configurar locale
sudo apt update && sudo apt install locales -y
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

# Verificar configurações de locale
locale

# Habilitar repositórios necessários
sudo apt install software-properties-common -y
sudo add-apt-repository universe -y

sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

# Instalar ferramentas de desenvolvimento e resolver problemas com chave GPG
sudo rm /etc/apt/sources.list.d/ros2.list
curl http://repo.ros2.org/repos.key | sudo apt-key add -
sudo cp /etc/apt/trusted.gpg /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Atualizar lista de pacotes e instalar ros-dev-tools
sudo apt update && sudo apt install ros-dev-tools -y

# Instalar ROS 2
sudo apt update && sudo apt upgrade -y
sudo apt install ros-iron-desktop -y

# Configurar ambiente
echo "source /opt/ros/iron/setup.bash" >> ~/.bashrc
source ~/.bashrc

echo "Instalação completa."


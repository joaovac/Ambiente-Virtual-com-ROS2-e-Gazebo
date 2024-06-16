#!/bin/bash

# Set locale
locale  # check for UTF-8

sudo apt update && sudo apt install -y locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale  # verify settings

# Setup Sources
sudo apt install -y software-properties-common
sudo add-apt-repository universe -y

sudo apt update && sudo apt install -y curl

# Remova o arquivo ros2.list que pode estar presente no local indicado:
sudo rm /etc/apt/sources.list.d/ros2.list

# Baixe a chave GPG e adicione-a ao sistema: 
curl http://repo.ros2.org/repos.key | sudo apt-key add -

# Copie o arquivo trusted.gpg para o local apropriado e renomeie-o:
sudo cp /etc/apt/trusted.gpg /usr/share/keyrings/ros-archive-keyring.gpg

sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

# Adicione a fonte ROS2 ao arquivo ros2.list:
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Install ROS2 packages
sudo apt update && sudo apt upgrade -y
sudo apt install -y ros-humble-desktop ros-dev-tools

# Environment setup
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

# Install colcon
sudo apt install -y python3-colcon-common-extensions

# Autocompletion
echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> ~/.bashrc
source ~/.bashrc

# Setup colcon_cd
echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> ~/.bashrc
echo "export _colcon_cd_root=/opt/ros/humble/" >> ~/.bashrc
source ~/.bashrc

# Install Gazebo 
sudo apt install -y ros-humble-gazebo-*

# Install Cartographer 
sudo apt install -y ros-humble-cartographer ros-humble-cartographer-ros

# Install Navigation2 
sudo apt install -y ros-humble-navigation2 ros-humble-nav2-bringup

# Install TurtleBot3 Packages
source ~/.bashrc
sudo apt install ros-humble-dynamixel-sdk -y
sudo apt install ros-humble-turtlebot3-msgs -y
sudo apt install ros-humble-turtlebot3 -y


#mkdir -p ~/turtlebot3_ws/src
#cd ~/turtlebot3_ws/src/
#git clone -b humble-devel https://github.com/ROBOTIS-GIT/DynamixelSDK.git
#git clone -b humble-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
#git clone -b humble-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
#cd ~/turtlebot3_ws
#colcon build --symlink-install --parallel-workers 2
#echo 'source ~/turtlebot3_ws/install/setup.bash' >> ~/.bashrc
#source ~/.bashrc

# Environment Configuration
echo 'export ROS_DOMAIN_ID=30 #TURTLEBOT3' >> ~/.bashrc
source ~/.bashrc

echo "Instalação concluída."

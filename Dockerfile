FROM osrf/ros:humble-desktop-full

RUN apt-get update -y
RUN apt-get upgrade -y
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
RUN source /opt/ros/humble/setup.bash

RUN apt install locales -y
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN apt install software-properties-common -y
RUN echo -ne '\n' | add-apt-repository universe
RUN apt update -y
RUN apt install curl -y
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null
RUN apt update
RUN apt upgrade
RUN apt install ros-humble-desktop-full -y

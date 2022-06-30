#!/bin/bash
#command to update apt
apt update -y
#command to install all new packages
apt upgrade -y
#command to intall new packages and uninstall old ones
apt full -upgrade -y
#command to remove unnecesary packages
apt autoremove --purge -y
#bonus one command:
apt update -y && apt upgrade -y && apt  full-upgrade -y && apt-get autoremove --purge -y

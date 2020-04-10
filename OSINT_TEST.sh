#!/bin/bash

# checks if user is root
if [ "$EUID" -ne 0 ];then
  echo "Please run sudo"
  exit
fi

# checks if dependencies are installed and upgrading. USE AT OWN RISK
if [[ ! -x "$(command -v lolcat)" ]];then
  cd
  sudo apt-get update -y > update;rm update
  sudo apt-get dist-upgrade -y > uprade;rm upgrade
fi
# checks if git is installed. Must have keys squared away or it will fail.
cd
touch git
tput setaf 2;echo "[*] Checking if git is installed. YOU MUST HAVE PRIVATE KEYS... for now :-)";tput sgr0;sleep 1
  sudo apt install git

tput setaf 2;echo "[*] setting up basic OSINT Tools... Do not forget to add your API keys to appropriate files after install.";tput sgr0;sleep 1.5
  cd /opt/
  sudo mkdir OSINT
  cd /opt/OSINT
  sudo git clone git@github.com:s1l3nt78/sifter.git
  sudo git clone git@github.com:thewhiteh4t/FinalRecon.git &
  wait
  sudo git clone git@github.com:thewhiteh4t/FinalRecon.git
  sudo git clone git@github.com:21y4d/nmapAutomator.git
  exit

#!/bin/bash

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
RESET='\033[0m'

echo -e "${CYAN}This program will automatically install all useful programs.${RESET}"

# Error handling and progress function
install() {
    package=$1
    total_steps=$2
    current_step=$3
    echo -e "${YELLOW}Installing $package... ($current_step/$total_steps)${RESET}"
    echo "$current_step" | pv -N "Progress" -W -p -b -s $total_steps > /dev/null
    sudo apt install -y $package
    if [ $? -ne 0 ]; then
        echo -e "${RED}Error installing $package${RESET}"
        exit 1
    fi
}

echo -e "${BLUE}Updating package list...${RESET}"
sudo apt update -y || { echo -e "${RED}Error updating package list${RESET}"; exit 1; }

# Total number of packages to install
total_packages=17
current_step=1

# Installing programs
install "nmap" $total_packages $current_step; current_step=$((current_step + 1))
install "hping3" $total_packages $current_step; current_step=$((current_step + 1))
install "legion" $total_packages $current_step; current_step=$((current_step + 1))
install "nikto" $total_packages $current_step; current_step=$((current_step + 1))
install "sqlmap" $total_packages $current_step; current_step=$((current_step + 1))
install "whatweb" $total_packages $current_step; current_step=$((current_step + 1))
install "wapiti" $total_packages $current_step; current_step=$((current_step + 1))
install "john" $total_packages $current_step; current_step=$((current_step + 1))
install "wifite" $total_packages $current_step; current_step=$((current_step + 1))
install "aircrack-ng" $total_packages $current_step; current_step=$((current_step + 1))
install "wordlists" $total_packages $current_step; current_step=$((current_step + 1))
install "clang" $total_packages $current_step; current_step=$((current_step + 1))
install "nasm" $total_packages $current_step; current_step=$((current_step + 1))

install "exploitdb" $total_packages $current_step; current_step=$((current_step + 1))
install "metasploit-framework" $total_packages $current_step; current_step=$((current_step + 1))

# Installing kali-whoami
echo -e "${YELLOW}Installing kali-whoami... ($current_step/$total_packages)${RESET}"
echo "$current_step" | pv -N "Progress" -W -p -b -s $total_packages > /dev/null
sudo apt install -y tar tor curl python3 python3-scapy network-manager || { echo -e "${RED}Error installing dependencies for kali-whoami${RESET}"; exit 1; }
git clone https://github.com/omer-dogan/kali-whoami || { echo -e "${RED}Error cloning kali-whoami${RESET}"; exit 1; }
cd kali-whoami || { echo -e "${RED}Error accessing kali-whoami directory${RESET}"; exit 1; }
sudo make install || { echo -e "${RED}Error installing kali-whoami${RESET}"; exit 1; }
cd ..

echo -e "${GREEN}Installation completed!${RESET}"
echo -e "${PURPLE}Program written by fkiraa${RESET}"

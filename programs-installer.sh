#!/bin/bash

echo "questo programma installerà automaticamente tutti i programmi utili"

echo "aggiornamento dell'elenco dei pacchetti..."
sudo apt update -y

echo "installazione di nmap..."
sudo apt install -y  nmap

echo "installazione di hping3.."
sudo apt install -y hping3

echo "installazione di legion(root)"
sudo apt install -y legion

echo "installazione di nikto"
sudo apt install -y nikto

echo "installazione di sqlmap"
sudo apt install -y sqlmap

echo "installazione di whatweb"
sudo apt install -y whatweb

echo "installazione di wapiti"
sudo apt install -y wapiti

echo "installazione di john the ripper(john)"
sudo apt install -y john

echo "installazione di wifite"
sudo apt install -y  wifite

echo "installazione di aircrack-ng"
sudo apt install -y aircrack-ng

echo "installazione di wordlists"
sudo apt install -y wordlists

echo "installazione di clang"
sudo apt-get -y install clang

echo "installazione di clang ++"
sudo apt-get -y install clang++

echo "installazione di NASM shell"
sudo apt install -y nasm

echo "installazione di searchsploit"
sudo apt install -y exploitdb

echo "installazione di metasploit framework"
sudo apt install -y metasploit-framework

echo "installazione di kali-whoami"
sudo apt install -y tar tor curl python3 python3-scapy network-manager
git clone https://github.com/omer-dogan/kali-whoami
cd kali-whoami
sudo make install

echo "installazione completata"
echo "programma scritto da andrea"

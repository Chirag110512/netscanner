# Student Details

Name         : Chirag Kabra
Reg No       : 24BAI10901
University   : VIT Bhopal University
Course       : Linux Programming Assignment

---

# NetScanner - Linux Network Scanner & Analyzer

A command-line network scanning tool built with Bash scripting on Linux.

---

## Environment Setup

### Step 1 - Install WSL (Windows users only)

    wsl --install -d Ubuntu

Restart PC. Open Ubuntu. Create username and password.

### Step 2 - Update system

    sudo apt update && sudo apt upgrade -y

### Step 3 - Install Git

    sudo apt install git -y

---

## Installation

### Step 4 - Clone the repository

    git clone https://github.com/Chirag110512/netscanner.git

### Step 5 - Go into project folder

    cd netscanner

### Step 6 - Give permissions

    chmod +x netscanner.sh
    chmod +x modules/*.sh

### Step 7 - Create folders

    mkdir -p logs reports

---

## Running the Project

Run with menu:

    ./netscanner.sh

Run with options:

    ./netscanner.sh --help
    ./netscanner.sh --info
    ./netscanner.sh --scan 192.168.1.0/24
    ./netscanner.sh --ports 8.8.8.8
    ./netscanner.sh --report

---

## Project Structure

    netscanner/
    ├── netscanner.sh
    ├── README.md
    ├── modules/
    │   ├── net_info.sh
    │   ├── discover.sh
    │   └── portscan.sh
    ├── logs/
    └── reports/

---

## Dependencies

No external tools needed. Uses built-in Linux commands:
bash, ping, ip, grep, awk, cut, seq

---

## Tested On

Ubuntu 22.04 LTS, WSL2, Windows 11

---

## Disclaimer

Only use on networks you own or have permission to scan.

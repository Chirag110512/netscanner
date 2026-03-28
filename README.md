#Student Details

Name: Chirag Kabra
Reg No.: 24BAI10901
University: Vit Bhopal University
Course: Open Source Linux

A command-line network scanning tool built with Bash scripting on Linux.
It can show network info, discover live hosts on a subnet, and scan open ports.

This project runs on Linux. If you are on Windows, use WSL (Windows Subsystem for Linux).

### Step 1 - Install WSL (Windows users only)

Open PowerShell as Administrator and run:

    wsl --install -d Ubuntu

Restart your PC. Then open Ubuntu from Start menu and create a username and password.

### Step 2 - Update your system

Open Ubuntu terminal and run:

    sudo apt update && sudo apt upgrade -y

### Step 3 - Install Git

    sudo apt install git -y

Verify:

    git --version

---

## Installation

### Step 4 - Clone the repository

    git clone https://github.com/Chirag110512/netscanner.git

### Step 5 - Go into the project folder

    cd netscanner
### Step 6 - Give execute permissions to all scripts

    chmod +x netscanner.sh
    chmod +x modules/*.sh

### Step 7 - Create required folders if not present

    mkdir -p logs reports

---

## Running the Project

### Run with interactive menu:

    ./netscanner.sh
You will see a menu like this:

    ===============================
       NetScanner - My Linux Tool
    ===============================
    1. Show my network info
    2. Find devices on network
    3. Scan ports on a device
    4. Show last report
    5. Exit
    ===============================

Type a number and press Enter to choose an option.

### Run with command line options:
Show help:

    ./netscanner.sh --help

Show network info (IP, gateway, DNS, internet status):

    ./netscanner.sh --info

Discover live hosts on a subnet:

    ./netscanner.sh --scan 192.168.1.0/24

Scan open ports on an IP:

    ./netscanner.sh --ports 8.8.8.8
View last saved scan report:

    ./netscanner.sh --report

---

## Project Structure

    netscanner/
    ├── netscanner.sh        <- main script, start here
    ├── README.md            <- this file
    ├── modules/
    │   ├── net_info.sh      <- shows local network information
    │   ├── discover.sh      <- discovers live hosts using ping
    │   └── portscan.sh      <- scans open TCP ports
    ├── logs/
    │   └── activity.log     <- auto generated activity log
    └── reports/
        └── scan_report.txt  <- auto saved scan results

## Dependencies

All tools used are pre-installed on Ubuntu Linux:

- bash
- ping
- ip
- grep
- awk
- cut
- seq

No external tools like nmap or python are needed.

## Tested On

- Ubuntu 22.04 LTS
- WSL2 on Windows 11
- Bash 5.1

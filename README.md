My Name is Chirag Kabra
This is my Linux assignment project. It is a network scanner built using bash scripting
that can find devices on a network and check open ports.

## What it does

- Shows your current network info like IP address, gateway, DNS servers
- Scans a subnet to find which devices are currently online
- Checks common ports on a given IP to see which ones are open
- Saves all results to a report file automatically

## Requirements

- Linux (tested on Ubuntu 22.04 with WSL2)
- Bash 4.0 or higher
- Tools: ping, ip, grep, awk (these come pre-installed on Linux)
- No need to install nmap or python

## How to Setup and Run

Step 1 - Clone the repository:

git clone https://github.com/Chirag110512/netscanner.git
cd netscanner

Step 2 - Give execute permissions:

chmod +x netscanner.sh
chmod +x modules/*.sh

Step 3 - Run the tool:

./netscanner.sh

This opens an interactive menu. Choose options by typing 1 to 5.

## Command Line Options

./netscanner.sh --help
./netscanner.sh --info
./netscanner.sh --scan 192.168.1.0/24
./netscanner.sh --ports 8.8.8.8
./netscanner.sh --report

## Examples

Show your network information:
./netscanner.sh --info

Find all live devices on your network:
./netscanner.sh --scan 192.168.1.0/24

Scan ports on Google DNS:
./netscanner.sh --ports 8.8.8.8

View last scan report:
./netscanner.sh --report

## Project Structure

netscanner/
├── netscanner.sh       <- main script, run this
├── README.md           <- this file
├── modules/
│   ├── net_info.sh     <- shows network details
│   ├── discover.sh     <- finds live hosts using ping
│   └── portscan.sh     <- checks open ports using /dev/tcp
├── logs/               <- activity logs saved here
└── reports/            <- scan results saved here

## How it works

- Host discovery uses ping to check each IP in the subnet one by one
- Port scanner uses the bash built-in /dev/tcp trick to test if a port is open
- Results are automatically saved to reports/scan_report.txt
- All activity is logged to logs/activity.log with timestamps

## Notes

- Host discovery only supports /24 subnets right now
- Port scanner checks 15 common ports
- Tested on Ubuntu 22.04 WSL2 on Windows 11

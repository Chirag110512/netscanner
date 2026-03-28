This is my Linux assignment project. It is a network scanner built using bash scripting.

## What it does

- Shows your current network info like IP, gateway, DNS
- Scans a subnet to find which devices are online
- Checks common ports on a given IP to see whats open
- Saves results to a report file

## Requirements

- Linux (Ubuntu)
- Bash
- Tools: ping, ip, grep, awk (already available on Linux)

## How to run

Clone the project:

git clone https://github.com/Chirag110512/netscanner.git
cd netscanner

Give permissions:

chmod +x netscanner.sh
chmod +x modules/*.sh

Run it:

./netscanner.sh

## Options

./netscanner.sh --help
./netscanner.sh --info
./netscanner.sh --scan 192.168.1.0/24
./netscanner.sh --ports 192.168.1.1
./netscanner.sh --report

netscanner/
├── netscanner.sh
├── README.md
├── modules/
│   ├── net_info.sh
│   ├── discover.sh
│   └── portscan.sh
├── logs/
└── reports/

## Notes

- Only works on /24 subnets for host discovery
- Scans 15 common ports
- Results saved to reports/scan_report.txt

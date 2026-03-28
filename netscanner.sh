#!/bin/bash

source ./modules/net_info.sh
source ./modules/discover.sh
source ./modules/portscan.sh

show_menu() {
    echo ""
    echo "==============================="
    echo "   NetScanner - My Linux Tool  "
    echo "==============================="
    echo "1. Show my network info"
    echo "2. Find devices on network"
    echo "3. Scan ports on a device"
    echo "4. Show last report"
    echo "5. Exit"
    echo "==============================="
    echo ""
}

show_report() {
    if [ ! -f reports/scan_report.txt ]; then
        echo "No report found yet. Run a scan first."
        return
    fi
    echo ""
    echo "--- Last Scan Report ---"
    cat reports/scan_report.txt
    echo "------------------------"
}

if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    echo "Usage: ./netscanner.sh [option]"
    echo ""
    echo "  --info        show network info"
    echo "  --scan <ip>   find live hosts"
    echo "  --ports <ip>  scan ports on an ip"
    echo "  --report      show last saved report"
    exit 0
fi

if [ "$1" == "--info" ]; then
    get_net_info
elif [ "$1" == "--scan" ]; then
    if [ -z "$2" ]; then
        echo "Error: give a subnet. Example: ./netscanner.sh --scan 192.168.1.0/24"
        exit 1
    fi
    find_hosts "$2"
elif [ "$1" == "--ports" ]; then
    if [ -z "$2" ]; then
        echo "Error: give an IP. Example: ./netscanner.sh --ports 192.168.1.1"
        exit 1
    fi
    scan_ports "$2"
elif [ "$1" == "--report" ]; then
    show_report
elif [ -n "$1" ]; then
    echo "Unknown option: $1"
    exit 1
else
    while true; do
        show_menu
        read -p "Choose (1-5): " choice
        if [ "$choice" == "1" ]; then
            get_net_info
        elif [ "$choice" == "2" ]; then
            read -p "Enter subnet (example: 192.168.1.0/24): " subnet
            find_hosts "$subnet"
        elif [ "$choice" == "3" ]; then
            read -p "Enter IP to scan: " target_ip
            scan_ports "$target_ip"
        elif [ "$choice" == "4" ]; then
            show_report
        elif [ "$choice" == "5" ]; then
            echo "Bye!"
            exit 0
        else
            echo "Invalid choice"
        fi
    done
fi

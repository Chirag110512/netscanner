#!/bin/bash

# port scanner using /dev/tcp bash trick

PORTS="21 22 23 25 53 80 110 143 443 445 3306 3389 5432 8080 8443"

PORT_NAME() {
    case $1 in
        21)  echo "FTP" ;;
        22)  echo "SSH" ;;
        23)  echo "Telnet" ;;
        25)  echo "SMTP" ;;
        53)  echo "DNS" ;;
        80)  echo "HTTP" ;;
        110) echo "POP3" ;;
        143) echo "IMAP" ;;
        443) echo "HTTPS" ;;
        445) echo "SMB" ;;
        3306) echo "MySQL" ;;
        3389) echo "RDP" ;;
        5432) echo "PostgreSQL" ;;
        8080) echo "HTTP-alt" ;;
        8443) echo "HTTPS-alt" ;;
        *)   echo "Unknown" ;;
    esac
}

scan_ports() {
    target=$1

    if [ -z "$target" ]; then
        echo "Please provide an IP address"
        return
    fi

    echo ""
    echo "Scanning ports on: $target"
    echo ""

    ping -c 1 -W 2 $target > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "Warning: host did not respond to ping"
        echo ""
    fi

    open_count=0

    echo "PORT       SERVICE        STATUS"
    echo "-------------------------------"

    for port in $PORTS; do
        service=$(PORT_NAME $port)
        timeout 1 bash -c "echo > /dev/tcp/$target/$port" 2>/dev/null
        if [ $? -eq 0 ]; then
            printf "%-10s %-15s OPEN\n" "$port" "$service"
            open_count=$((open_count + 1))
        fi
    done

    echo "-------------------------------"
    echo "Open ports found: $open_count"

    mkdir -p reports
    echo "" >> reports/scan_report.txt
    echo "Port Scan - $(date)" >> reports/scan_report.txt
    echo "Target: $target" >> reports/scan_report.txt
    echo "Open: $open_count ports" >> reports/scan_report.txt

    mkdir -p logs
    echo "[$(date)] port scan on $target - $open_count open" >> logs/activity.log
}

#!/bin/bash

# host discovery using ping

find_hosts() {
    subnet=$1

    if [ -z "$subnet" ]; then
        echo "Please give a subnet"
        return
    fi

    echo ""
    echo "Scanning $subnet for live hosts..."
    echo "This might take a minute"
    echo ""

    base=$(echo $subnet | cut -d'/' -f1 | cut -d'.' -f1-3)
    prefix=$(echo $subnet | cut -d'/' -f2)

    if [ "$prefix" != "24" ]; then
        echo "Sorry, only /24 subnets supported for now"
        return
    fi

    found=0
    live_hosts=""

    for i in $(seq 1 254); do
        target="$base.$i"
        ping -c 1 -W 1 $target > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "  ALIVE: $target"
            live_hosts="$live_hosts $target"
            found=$((found + 1))
        fi
    done

    echo ""
    echo "Done. Found $found host(s)"

    mkdir -p reports
    echo "Host Discovery - $(date)" > reports/scan_report.txt
    echo "Subnet: $subnet" >> reports/scan_report.txt
    echo "Found: $found hosts" >> reports/scan_report.txt
    for h in $live_hosts; do
        echo "ALIVE: $h" >> reports/scan_report.txt
    done

    mkdir -p logs
    echo "[$(date)] host discovery on $subnet - found $found" >> logs/activity.log
}

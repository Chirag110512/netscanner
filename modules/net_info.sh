#!/bin/bash

# this file shows info about the current machine's network

get_net_info() {
    echo ""
    echo "--- Network Information ---"

    myhostname=$(hostname)
    echo "Hostname: $myhostname"

    echo ""
    echo "Network Interfaces:"
    ip -4 addr show | grep -v "127.0.0.1" | grep "inet " | while read line; do
        ip_addr=$(echo $line | awk '{print $2}')
        iface=$(echo $line | awk '{print $NF}')
        echo "  $iface  ->  $ip_addr"
    done

    echo ""
    gateway=$(ip route | grep default | awk '{print $3}')
    if [ -z "$gateway" ]; then
        echo "Gateway: not found"
    else
        echo "Gateway: $gateway"
    fi

    echo ""
    echo "DNS Servers:"
    grep nameserver /etc/resolv.conf | awk '{print "  " $2}'

    echo ""
    echo "Checking internet..."
    ping -c 1 -W 2 8.8.8.8 > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "Internet: Connected"
    else
        echo "Internet: Not reachable"
    fi

    echo ""
    echo "OS info:"
    uname -a

    echo "---------------------------"

    mkdir -p logs
    echo "[$(date)] ran net info" >> logs/activity.log
}


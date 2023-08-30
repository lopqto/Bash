#!/bin/bash

# This script is used to manage the default gateway on a Linux system.

# Check if user has root privileges
if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root."
    exit
fi

# Get the list of interfaces (only ethernet and wifi)
interfaces=$(ip link show | grep -E "enp|wlp" | awk '{print $2}' | sed 's/://')

# Show the menu
PS3="Select the interface to manage the default gateway: "
select interface in $interfaces; do
    break
done

# Remove the default gateway
ip route del default

# Calculate the default gateway IP address
# Get the IP address of the interface
ip_address=$(ip addr show "$interface" | grep "inet " | awk '{print $2}')

# Get the network portion of the IP address and append it to 1
# to get the default gateway IP address
gateway=$(echo "$ip_address" | awk -F "." '{print $1"."$2"."$3"."1}')

# Add the default gateway
ip route add default via "$gateway"

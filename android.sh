#!/bin/bash
user=Mr.Panther

echo -e "\n"
echo -e "\tHello \tMy \tFriend..."
echo -e "\nThis script is made by your's truly $user"
echo -e "\nI know you are here to change your mac id"
echo -e "\nYou want to become Anonymus. RIGHT!!!!"

# Check if the user has root privileges
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root."
  exit 1
fi

# Get the current MAC address of the eth0 interface
current_mac=$(ip link show eth0 | awk '/ether/ {print $2}')

# Ask the user for the new MAC address
echo -e "\nCurrent MAC Address: $current_mac"
echo -e "\nEnter the new MAC Address (e.g. 00:11:22:33:44:55):"
read new_mac

# Validate the new MAC address format
if ! [[ $new_mac =~ ^([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}$ ]]; then
  echo "Invalid MAC Address format. Please enter a valid MAC Address."
  exit 1
fi

# Change the MAC address of the eth0 interface
sudo ifconfig eth0 down
sudo macchanger -m $new_mac eth0
sudo ifconfig eth0 up

# Confirm the MAC address change
new_mac=$(ip link show eth0 | awk '/ether/ {print $2}')
echo -e "\nNew MAC Address: $new_mac"

echo -e "\n\tThanks \tfor \tusing"

echo -e "\n WARNING : DO NOT DO ANYTHING ILLEGAL "

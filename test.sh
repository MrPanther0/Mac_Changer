#!/bin/bash

# Define the user variable
user="Mr.panther"

# Print a greeting message
echo -e "\n"
echo "This script is made by $user"
echo -e "\nYou can choose to generate a random MAC address or specify a custom one.\n"

# Get the user's choice
read -p "Generate random MAC address (y/n): " choice

# Generate a random MAC address or get the user-defined one
if [ "$choice" == "y" ]; then
  new_mac=$(cat /dev/urandom | tr -dc 'a-f0-9' | fold -w 2 | head -n 1)
else
  read -p "Enter a custom MAC address (e.g., 00:11:22:33:44:55): " new_mac
fi

# Validate the user's input
if ! echo $new_mac | grep -E "^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$" &> /dev/null; then
  echo "Error: Invalid MAC address format."
  exit 1
fi

# Get the interface name
read -p "Enter the network interface to change the MAC address (e.g., eth0): " interface

# Check if the specified interface exists
if ! ip link show $interface &> /dev/null; then
  echo "Error: Invalid interface specified."
  exit 1
fi

# Change the MAC address of the specified interface
sudo macchanger -m $new_mac $interface

# Print a success message
echo -e "\nMAC address of $interface has been changed to $new_mac.\n"

# Print a thank you message
echo -e "\nThanks for using this script!"
echo -e "\n"

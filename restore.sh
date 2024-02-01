#!/bin/bash

# Define the user variable
user="Mr.panther"

# Print a greeting message
echo -e "\n"
echo "This script is made by $user"
echo -e "\nThis script will restore the original MAC address of your network interface.\n"

# Get the interface name
read -p "Enter the network interface whose MAC address you want to restore (e.g., eth0): " interface

# Check if the specified interface exists
if ! ip link show $interface &> /dev/null; then
  echo "Error: Invalid interface specified."
  exit 1
fi

# Get the original MAC address of the interface
original_mac=$(ip link show $interface | grep link/ether | awk '{print $2}')

# Restore the original MAC address
sudo macchanger -p $interface

# Print a success message
echo -e "\nThe original MAC address of $interface ($original_mac) has been restored.\n"

# Print a thank you message
echo -e "\nThanks for using this script!"
echo -e "\n"

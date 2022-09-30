
#!/bin/bash
user=Mr.Panther

echo -e "\n"
echo -e "\tHello \tMy \tFriend..."
echo -e "\nThis script is made by your's truly $user"
echo -e "\nI know you are here to change your mac id"
echo -e "\nYou want to become Anonymus. RIGHT!!!!"



echo -e "\nJust enter the mac id you want to be :"
read mac
echo -e "\n"
sudo macchanger -m $mac eth0

echo -e "\n\tThanks \tfor \tusing"

echo -e "\n WARNING : DO NOT DO ANYTHING ILLEGAL "


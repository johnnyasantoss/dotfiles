#!/usr/bin/python3
from os import system

file = open("vpn-id.txt")
uuid = file.readline().strip()
file.close()

print("Starting VPN '" + uuid + "'...")
output = system("nmcli con up " + uuid)

if output == 0:
    print("Connected.")
    exit(0)
else:
    print("Something went wrong. :(")
    exit(1)

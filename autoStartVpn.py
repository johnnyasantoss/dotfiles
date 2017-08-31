import os

file = open("vpn-id.txt")
uuid = file.readline()
file.close()

print("Starting VPN '" + uuid + "'...")
output = os.system("nmcli con up " + uuid)

if output == 0:
    print("Connected.")
else:
    print("Something went wrong. :(")

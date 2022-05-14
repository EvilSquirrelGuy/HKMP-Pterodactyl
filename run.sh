#!/bin/bash
echo "Checking existing server file..."
if [ ! -f "/HKMP/HKMPServer.exe" ]; then
        echo "Not found, copy..."
        cp /HKMPServer.exe /HKMP/HKMPServer.exe;
else
        echo "Found! Checking checksum..."
        if [ `md5sum /HKMPServer.exe | awk '{print $1}'` != `md5sum /HKMP/HKMPServer.exe | awk '{print $1}'` ]; then
                echo "Checksum mismatch, updating file..."
                cp /HKMPServer.exe /HKMP/HKMPServer.exe;
        else
                echo "Matched!"
        fi
fi
echo "Staring server in screen. To attach: screen -x. To detach: ctrl+a d"
screen -d -m -S server mono /HKMP/HKMPServer.exe 2222
while true; do
        sleep 5;
        if [ `ps | grep mono -c` -le 1 ]; then
                echo "Server stopped. Exiting..."
                exit 0
        fi
done

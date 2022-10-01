#!/bin/bash
echo "Checking existing server file..."
if [ ! -f "/HKMP/HKMPServer.exe" ]; then
        echo "EXE-file not found, copy..."
        cp /FILES/HKMPServer.exe /HKMP/HKMPServer.exe;
else
        echo "EXE-file found! Compare checksum..."
        if [ `md5sum /FILES/HKMPServer.exe | awk '{print $1}'` != `md5sum /HKMP/HKMPServer.exe | awk '{print $1}'` ]; then
                echo "Checksum mismatch, updating file..."
                cp /FILES/HKMPServer.exe /HKMP/HKMPServer.exe;
        else
                echo "Matched!"
        fi
fi
if [ ! -f "/HKMP/HKMPServer.pdb" ]; then
        echo "PDB-file not found, copy..."
        cp /FILES/HKMPServer.pdb /HKMP/HKMPServer.pdb;
else
        echo "PDB-file found! Compare checksum..."
        if [ `md5sum /FILES/HKMPServer.pdb | awk '{print $1}'` != `md5sum /HKMP/HKMPServer.pdb | awk '{print $1}'` ]; then
                echo "Checksum mismatch, updating file..."
                cp /FILES/HKMPServer.pdb /HKMP/HKMPServer.pdb;
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

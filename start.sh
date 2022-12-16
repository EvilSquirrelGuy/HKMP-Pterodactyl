#!/bin/bash
SESSION="server"
LOG="logs/server.log"
EXE="HKMPServer.exe"
PDB="HKMPServer.pdb"
DIR="/HKMP"
TMPDIR="/FILES"

[ ! -z "$PORT" ] || PORT=2222;

start() {
        echo "Staring server. Use hkmp command for interact."
        screen -d -m -S ${SESSION} mono ${DIR}/${EXE} $PORT
        while true; do sleep 5; [ `ps | grep mono -c` -le 1 ] && echo "Server stopped. Exiting..." && exit 0; done
}

update() {
        echo "Installing/Updating files..."
        LATEST=$(curl -s https://api.github.com/repos/Extremelyd1/HKMP/releases | egrep 'html_url.*tag' | awk -F\" '{print $4}' | cut -d\/ -f8 | head -n1);
        curl -o ${TMPDIR}/HKMPServer.zip -sOL https://github.com/Extremelyd1/HKMP/releases/download/$LATEST/HKMPServer.zip
        unzip -o ${TMPDIR}/HKMPServer.zip -d ${TMPDIR} && rm ${TMPDIR}/HKMPServer.zip
        cp ${TMPDIR}/* ${DIR}/;
        echo $LATEST > ${DIR}/version;
        [ -f ${DIR}/update ] && rm ${DIR}/update;
}

[ -f ${DIR}/update ] && update
[[ -f ${DIR}/${EXE} && -f ${DIR}/${PDB} ]] && start || update

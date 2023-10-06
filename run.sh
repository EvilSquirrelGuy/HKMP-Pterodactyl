#!/bin/bash
SESSION="server"
LOG="logs/server.log"
EXE="HKMPServer.exe"
PDB="HKMPServer.pdb"
DIR="/HKMP"
TMPDIR="/FILES"

[ ! -z "$PORT" ] || PORT=2222;

[ -f ${DIR}/${EXE} ] && rm -f ${DIR}/${EXE};
[ -f ${DIR}/${PDB} ] && rm -f ${DIR}/${PDB};
[ ! -f ${DIR}/${EXE} ] && cp ${TMPDIR}/${EXE} ${DIR}/${EXE};
[ ! -f ${DIR}/${PDB} ] && cp ${TMPDIR}/${PDB} ${DIR}/${PDB};

echo "Staring server. Use hkmp command for interact."
screen -d -m -S ${SESSION} mono ${DIR}/${EXE} $PORT
sleep 3
tail -f $LOG &
while true; do sleep 5; [ `ps | grep mono -c` -le 1 ] && echo "Server stopped. Exiting..." && exit 0; done

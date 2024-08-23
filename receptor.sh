#/bin/bash

tsp -I srt --caller $MAINIP:$1 \
--passphrase $MAINPASSPHRASE --latency $LATENCY | \
tsstuff -b $BRSERVICE --buffer-size 16000000  | \
tsp -v -b $BRSERVICE -O dektec -d $2 > log/receptor$1.log 2>&1 &



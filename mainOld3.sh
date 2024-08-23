#/bin/bash

source env.sh
servicio=
output=
port=

    case $1 in
                "1" )
                 servicio=$MAINHDX11
                 output="0"
                 port="5001"
                ;;
                "2" )
                 servicio=$MAINHDX12
                 output="1"
                 port="5000"
                ;;
                "3" )
                 servicio=$MAINHDX13
                 output="2"
                 port="5002"
                ;;
                "*" )
                 break
                ;;
        esac

pids=$(ps -eo pid,args | grep srt | grep $servicio | awk 'NF > 2 {print $1}')
kill -9 $pids 
sleep 1
pidt=$(ps -eo pid,args | grep tsp | grep $port | awk 'NF > 6 {print $1}')
kill -9 $pidt

srt-live-transmit  srt://$MAINIP:$servicio/?passphrase=$MAINPASSPHRASE\&latency=$LATENCYM udp://localhost:$port  > log/srt$1.log 2>&1 & \
#tsstuff -b $BRSERVICE --buffer-size 16000000  | \
tsp -v --debug  -I ip $port -O dektec -d $output > log/receptor$1.log 2>&1 &
# echo $servicio
# echo $output -b $BRSERVICE 

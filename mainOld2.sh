#/bin/bash
pid=$(ps -eo pid,args | grep )
servicio=
output=

    case $1 in
                "1" )
                 servicio=$MAINHDX11
                 output="0"
                ;;
                "2" )
                 servicio=$MAINHDX12
                 output="1"
                ;;
                "3" )
                 servicio=$MAINHDX13
                 output="2"
                ;;
                "*" )
                 break
                ;;
        esac

pid=$(ps -eo pid,args | grep $servicio | awk 'NF > 6 {print $1} ')
kill -9 $pid 

tsp  -I srt --caller $MAINIP:$servicio \
--passphrase $MAINPASSPHRASE --latency $LATENCY | \
tsstuff -b $BRSERVICE --buffer-size 16000000  | \
tsp -v --debug  -b $BRSERVICE -O dektec -d $output > log/receptor$1.log 2>&1 &
# echo $servicio
# echo $output

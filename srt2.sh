#/bin/bash
#pid=$(ps -eo pid,args | grep )
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

srt-live-transmit srt://$MAINIP:$servicio/?passphrase=$MAINPASSPHRASE\&latency=$LATENCY file://con > s$1 & \
#tsstuff -b $BRSERVICE --buffer-size 16000000  | \
tsp -v --debug  -I file s$1 -O dektec -d $output > log/receptor$1.log 2>&1 &
# echo $servicio
# echo $output  -b $BRSERVICE 

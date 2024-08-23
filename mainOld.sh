
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


tsp -I srt --caller $MAINIP:$servicio \
--passphrase $MAINPASSPHRASE --latency $LATENCY | \
tsstuff -b $BRSERVICE --buffer-size 16000000  | \
tsp -v -b $BRSERVICE -O dektec -d $output > log/receptor$1.log 2>&1 &
# echo $servicio
# echo $output

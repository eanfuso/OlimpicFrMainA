#/bin/bash
# Define colores
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
serv="1"
sleep="1"
echo -e "${RED}------------------------------------Diagnóstico MAIN 1-2-3 ${NC}------------------------------------"

for i in {1..3}
do
echo -e "${GREEN}Verificando la recepcion $i ${NC}------------------------------------"
tail -n 5 /home/cloud2/Olimpicos/log/srt$i.log
#i= $i + 1
sleep $sleep
done
#$VIN/${!video}

for i in {1..3}
do
echo -e "${BLUE}/////////////////////////////////////////////////////"
echo -e "${BLUE}Verificando salida ASI Nº $i ${NC}------------------------------------"
tail -n 3 /home/cloud2/Olimpicos/log/receptor$i.log
echo -e "∖n"
#j=$((i - 1))
port="500"${i}
ps -eo pid,pcpu,pmem,args | grep tsp | grep $port | awk  'NF > 6 {print "pid=" $1 " cpu=" $2}'
#i= $i + 1
sleep $sleep
done

echo -e "${GREEN}Operación reciente de los servicios ##############################################${NC}"
tail -n 20 /home/cloud2/Olimpicos/back/back.log
echo -e "${GREEN}##########################################################################${NC}"

echo -e "${RED}Verificando inactividad del sistema ${NC}------------------------------------"
top -b -n1 | grep "Cpu(s)" | awk '{print $8}'





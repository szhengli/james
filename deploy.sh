#!/usr/bin/bash

source /opt/lib.sh

# The deployment target server
HOST=192.168.33.200


# The JARs home 
HOME=/opt/chinayie

#Jar Path
TRA=$HOME/trade
TRT=$HOME/trade-task
PAY=$HOME/payment
COM=$HOME/common-service
PLA=$HOME/platform-mgmt
SOC=$HOME/socketIO-server

#Jar file
TRA_J=`get_file $TRA trades`
TRT_J=`get_file $TRT trade_task`
PAY_J=`get_file $PAY gy_pay`
COM_J=`get_file $COM common_service`
PLA_J=`get_file $PLA  platform_mgmt`
SOC_J=`get_file $SOC  socketIO_server`

# the startup script to be run on the target server
CMD="sh run.sh"

# the command to check if the deployment of a specific package is successful
CHECK="[ `echo $?` -eq 0 ] && echo ok || echo bad"


scp $SOC/$SOC_J $HOST:/$SOC/ ; ssh $HOST "cd $SOC;  $CMD"
echo "Deploy Trade:"
eval  $CHECK

scp $TRA/$TRA_J $HOST:/$TRA/ ; ssh $HOST "cd $TRA;  $CMD"
echo "Deploy Trade:"
eval  $CHECK

scp $TRT/$TRT_J $HOST:/$TRT/ ; ssh $HOST "cd $TRT;  $CMD"
echo "Deploy Trade_task:"
eval  $CHECK

scp $PAY/$PAY_J $HOST:/$PAY/ ; ssh $HOST "cd $PAY;  $CMD"
echo "Deploy gy_pay:"
eval  $CHECK

scp $COM/$COM_J $HOST:/$COM/ ; ssh $HOST "cd $COM;  $CMD"
echo "Deploy common_service:"
eval  $CHECK

scp $PLA/$PLA_J $HOST:/$PLA/ ; ssh $HOST "cd $PLA;  $CMD"
echo "platform_mgmt:"
eval  $CHECK












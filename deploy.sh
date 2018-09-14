HOST=

HOME=/opt/chinayie

#Jar Path
TRA=$HOME/trade
TRT=$HOME/trade-task
PAY=$HOME/payment
COM=$HOME/common-service
PLA=$HOME/platform-mgmt
SOC=$HOME/socketIO-server

#Jar file
TRA_J=trades-106-20180914.jar
TRT_J=trade-task.jar
PAY_J=gy_pay.jar
COM_J=common-service.jar
PLA_J=platform-mgmt.jar
SOC-J=socketIO-server.jar

CMD="sh run.sh"
CHECK="[ `echo $?` -eq 0 ] && echo ok || echo bad"

scp $TRA/$TRA_J $HOST:/$TRA/ ; ssh $HOST "cd $TRA;  $CMD"
eval  $CHECK
scp $TRT/$TRT_J $HOST:/$TRT/ ; ssh $HOST "cd $TRT;  $CMD"
eval  $CHECK
scp $PAY/$PAY_J $HOST:/$PAY/ ; ssh $HOST "cd $PAY;  $CMD"
eval  $CHECK
scp $COM/$COM_J $HOST:/$COM/ ; ssh $HOST "cd $COM;  $CMD"
eval  $CHECK
scp $PLA/$PLA_J $HOST:/$PLA/ ; ssh $HOST "cd $PLA;  $CMD"
eval  $CHECK
scp $SOC/$SOC_J $HOST:/$SOC/ ; ssh $HOST "cd $SOC;  $CMD"
eval  $CHECK

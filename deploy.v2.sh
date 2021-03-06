#!/usr/bin/bash
source /opt/lib.sh



#The deployment target server
#HOST=192.168.10.132
#HOST=106.14.173.237
#HOST=47.100.53.52

WARN=`echo -e "\e[1;31m真的要部署到${HOST}吗? [y/n] \e[0m"`

read -r -p "$WARN" CONFIRM

case $CONFIRM in
    [yY])
        ;;
    *)
        echo "终止执行脚本!"
        exit
esac


# The JARs home 
HOME=/opt/chinayie
declare  -A JARS

#JARS Path

JARS[$HOME/trade]=trades
JARS[$HOME/trade-task]=trade_task
JARS[$HOME/payment]=gy_pay
JARS[$HOME/common-service]=common_service
JARS[$HOME/platform-mgmt]=platform_mgmt
JARS[$HOME/socketIO-server]=socketIO_server

CMD="sh run.sh"
CHECK="[ `echo $?` -eq 0 ] && echo ok || echo bad"

for JPATH in ${!JARS[@]}
do
  JFILE=`get_file $JPATH  ${JARS[$JPATH]}`
  #scp $JPATH/$JFILE $HOST:/$JPATH/ ; ssh $HOST "cd $JPATH;  $CMD 1>/dev/null"
  echo "Deploy $JFILE:"
  #eval  $CHECK
done


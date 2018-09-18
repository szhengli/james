
# To retrive the right file name, based on the maximum of the buid_number embeded in the 
# file name

get_file() {
       DIR=$1
       MOD=$2
       
       BUILD=`eval  ls -l  $DIR | awk "/$MOD-[0-9]+\-[0-9]+\.jar"'/ {print $9}' \
                  | awk -F- '{print $2}' |sort -n | tail -n1`

       JARFILE=`eval find $DIR -name $MOD-$BUILD*.jar | xargs basename`

       echo $JARFILE
      }

#get_file  "/opt/chinayie/platform-mgmt"  "platform_mgmt"
#get_file  "/opt/chinayie/common-service"  "common_service"

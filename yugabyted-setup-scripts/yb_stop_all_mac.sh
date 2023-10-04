# Mac Version
# Doc reference: https://docs.yugabyte.com/preview/reference/configuration/yugabyted/#stop 

# Set base directory
BASEDIR=$HOME/yb

# Stop nodes...
printf "\nStopping nodes...\n"
printf "\nnode1..."
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted stop --base_dir=$BASEDIR/node1

until $BASEDIR/yugabyte-2.19.2.0/bin/yugabyted status --base_dir=$BASEDIR/node1 | grep "Status\|yugabyted is not running." | sed 's/.*: //; s/|.*//' | grep "Stopped\|yugabyted is not running.";
do 
  sleep 1; 
done

printf "\nnode2..."
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted stop --base_dir=$BASEDIR/node2

until $BASEDIR/yugabyte-2.19.2.0/bin/yugabyted status --base_dir=$BASEDIR/node2 | grep "Status\|yugabyted is not running." | sed 's/.*: //; s/|.*//' | grep "Stopped\|yugabyted is not running.";
do
  sleep 1;
done

printf "\nnode3..."
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted stop --base_dir=$BASEDIR/node3

until $BASEDIR/yugabyte-2.19.2.0/bin/yugabyted status --base_dir=$BASEDIR/node3 | grep "Status\|yugabyted is not running." | sed 's/.*: //; s/|.*//' | grep "Stopped\|yugabyted is not running.";
do
  sleep 1;
done

exit

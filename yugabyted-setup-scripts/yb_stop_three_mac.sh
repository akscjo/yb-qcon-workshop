# Mac Version
# Doc reference: https://docs.yugabyte.com/preview/reference/configuration/yugabyted/#stop 

# Set base directory
BASEDIR=$HOME/yb

# Stop nodes 4-6...
printf "\nStopping node 4...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted stop --base_dir=$BASEDIR/node4

until $BASEDIR/yugabyte-2.19.2.0/bin/yugabyted status --base_dir=$BASEDIR/node4| grep Status | sed 's/.*: //; s/|.*//' | grep "Stopped";
do
  sleep 1;
done

printf "\nStopping node 4...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted stop --base_dir=$BASEDIR/node5

until $BASEDIR/yugabyte-2.19.2.0/bin/yugabyted status --base_dir=$BASEDIR/node5| grep Status | sed 's/.*: //; s/|.*//' | grep "Stopped";
do
  sleep 1;
done

printf "\nStopping node 4...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted stop --base_dir=$BASEDIR/node6

until $BASEDIR/yugabyte-2.19.2.0/bin/yugabyted status --base_dir=$BASEDIR/node6| grep Status | sed 's/.*: //; s/|.*//' | grep "Stopped";
do
  sleep 1;
done

exit

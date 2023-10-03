# Mac Version
# Doc reference: https://docs.yugabyte.com/preview/reference/configuration/yugabyted/#stop 

# Set base directory
BASEDIR=$HOME/yb

# Stop nodes...
printf "\nStopping nodes...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted stop --base_dir=$BASEDIR/node1
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted stop --base_dir=$BASEDIR/node2
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted stop --base_dir=$BASEDIR/node3

exit

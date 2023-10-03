# Mac Version
# Doc reference: https://docs.yugabyte.com/preview/reference/configuration/yugabyted/#destroy

# Set base directory
BASEDIR=$HOME/yb

# Destroy nodes...
printf "\nDestroying nodes...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted destroy --base_dir=$BASEDIR/node1
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted destroy --base_dir=$BASEDIR/node2
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted destroy --base_dir=$BASEDIR/node3

exit

# Mac Version
# Doc reference: https://docs.yugabyte.com/preview/reference/configuration/yugabyted/#destroy

# Set base directory
BASEDIR=$HOME/yb

# Destroy nodes 4-6...
printf "\nDestroying node 4...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted destroy --base_dir=$BASEDIR/node4

printf "\nDestroying node 5...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted destroy --base_dir=$BASEDIR/node5

printf "\nDestroying node 6...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted destroy --base_dir=$BASEDIR/node6

exit

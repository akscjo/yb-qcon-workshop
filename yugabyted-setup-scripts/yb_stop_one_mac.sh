# Mac Version
# Doc reference: https://docs.yugabyte.com/preview/reference/configuration/yugabyted/#stop 

# Stop node...
printf "\nStopping node $1...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted stop --base_dir=$BASEDIR/$1

exit

# Mac Version
# Doc reference: https://docs.yugabyte.com/preview/reference/configuration/yugabyted/#stop 

# Set base directory
BASEDIR=$HOME/yb

# Verify that node was passed as a parameter
if [ -z "$1" ]
then
  echo "Please provide a node to stop (i.e. node3)"
  exit 0
else
  NODEDIR=$BASEDIR/$1;
fi

# Stop node...
printf "\nStopping node $1...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted stop --base_dir=$NODEDIR

until $BASEDIR/yugabyte-2.19.2.0/bin/yugabyted status --base_dir=$NODEDIR | grep Status | sed 's/.*: //; s/|.*//' | grep "Stopped";
do
  sleep 1;
done

exit

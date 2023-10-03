# Mac Version
# Doc reference: https://docs.yugabyte.com/preview/reference/configuration/yugabyted/#start

# Set base directory
BASEDIR=$HOME/yb

# Verify that node was passed as a parameter
if [ -z "$1" ]
then
  echo "Please provide a node to start (i.e. node3)"
  exit 0
else
  NODEDIR=$BASEDIR/$1;
fi

# Start node...
printf "\nStarting node $1...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted start --base_dir=$NODEDIR

until $BASEDIR/yugabyte-2.19.2.0/bin/yugabyted status --base_dir=$NODEDIR | grep Status | sed 's/.*: //; s/|.*//' | grep "Running.";
do
  sleep 1;
done

exit

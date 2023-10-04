# Mac Version
# Doc reference: https://docs.yugabyte.com/preview/reference/configuration/yugabyted/#destroy

# Set base directory
BASEDIR=$HOME/yb

# Verify that node was passed as a parameter
if [ -z "$1" ]
then
  echo "Please provide a node to destroy (i.e. node3)"
  exit 0
else
  NODEDIR=$BASEDIR/$1;
fi

# Destroying node...
printf "\nDestroying node $1...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted destroy --base_dir=$NODEDIR

exit

# Mac Version
# Doc reference: https://docs.yugabyte.com/preview/reference/configuration/yugabyted/#start

# Set base directory
BASEDIR=$HOME/yb

# Start primary node
printf "\nStarting primary node...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted start --base_dir=$BASEDIR/node1 > $BASEDIR/node1_start.log

# Start 2nd node
printf "\nStarting node 2...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted start --base_dir=$BASEDIR/node2 > $BASEDIR/node2_start.log

# Start 3rd node
printf "\nStarting node 3...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted start --base_dir=$BASEDIR/node3 > $BASEDIR/node3_start.log

# Wait a bit
sleep 30

# Verify connectivity
until $BASEDIR/yugabyte-2.19.2.0/postgres/bin/pg_isready -h 127.0.0.1 -p 5433 ; do sleep 1 ; done
until $BASEDIR/yugabyte-2.19.2.0/postgres/bin/pg_isready -h 127.0.0.2 -p 5433 ; do sleep 1 ; done
until $BASEDIR/yugabyte-2.19.2.0/postgres/bin/pg_isready -h 127.0.0.3 -p 5433 ; do sleep 1 ; done

# Verify 3 nodes are up! 
printf "\nYugabyteDB Universe...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/ysqlsh -h 127.0.0.1 -c "SELECT host, node_type, cloud, region, zone FROM yb_servers() ORDER BY host;"

exit

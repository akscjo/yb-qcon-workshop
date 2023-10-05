# Mac Version
# Doc reference: https://docs.yugabyte.com/preview/quick-start/

# Base directory to install YB and nodes
BASEDIR=$HOME/yb

# Enable additional loopback addresses:
sudo ifconfig lo0 alias 127.0.0.4 up

# Start 4th node
printf "\nStarting node 4...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted start --advertise_address 127.0.0.4 --base_dir=$BASEDIR/node4 --cloud_location cloud.region1.node4 --fault_tolerance=zone --join=127.0.0.1 --tserver_flags="ysql_enable_packed_row=true,ysql_beta_features=true,yb_enable_read_committed_isolation=true,enable_deadlock_detection=true,enable_wait_queues=true" --master_flags="ysql_enable_packed_row=true"

# Wait a bit
printf "\nFinishing up, please wait 20 seconds...\n"
sleep 20

# Check connectivity to new node
until $BASEDIR/yugabyte-2.19.2.0/postgres/bin/pg_isready -h 127.0.0.4 -p 5433 ; do sleep 1 ; done

# Verify 4 nodes are up!
printf "\nYugabyteDB Universe...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/ysqlsh -h 127.0.0.1 -c "SELECT host, node_type, cloud, region, zone FROM yb_servers() ORDER BY host;"

exit

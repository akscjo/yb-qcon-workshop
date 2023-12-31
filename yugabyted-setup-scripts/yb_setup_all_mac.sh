# Mac Version
# Doc reference: https://docs.yugabyte.com/preview/quick-start/

# Python must be installed!
# To get Python: https://www.python.org/downloads/
# Might need to add a symbolic link?
#   ln -s -f /usr/local/bin/python3 /usr/local/bin/python
# Verify: python --version

# Base directory to install YB and nodes
BASEDIR=$HOME/yb

# Create base directory if it does not exist
if [ ! -d $BASEDIR ]
then
     mkdir -p $BASEDIR
     # Download YB for Mac
     printf "\nDownloading YugabyteDB...\n"
     curl https://downloads.yugabyte.com/releases/2.19.2.0/yugabyte-2.19.2.0-b121-darwin-x86_64.tar.gz > $BASEDIR/yugabyte-2.19.2.0-b121-darwin-x86_64.tar.gz

     # Extract Tarball
     printf "\nExtracting Tarball...\n"
     tar xfz $BASEDIR/yugabyte-2.19.2.0-b121-darwin-x86_64.tar.gz --directory $BASEDIR
else
     echo "YB base directory already exists"
fi

# Enable additional loopback addresses:
sudo ifconfig lo0 alias 127.0.0.2 up
sudo ifconfig lo0 alias 127.0.0.3 up

# Start primary node
printf "\nStarting primary node...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted start --advertise_address 127.0.0.1 --base_dir=$BASEDIR/node1 --cloud_location cloud.region1.node1 --fault_tolerance=zone --tserver_flags="ysql_enable_packed_row=true,ysql_beta_features=true,yb_enable_read_committed_isolation=true,enable_deadlock_detection=true,enable_wait_queues=true" --master_flags="ysql_enable_packed_row=true"

sleep 5

# Start 2nd node
printf "\nStarting node 2...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted start --advertise_address 127.0.0.2 --base_dir=$BASEDIR/node2 --cloud_location cloud.region1.node2 --fault_tolerance=zone --join=127.0.0.1 --tserver_flags="ysql_enable_packed_row=true,ysql_beta_features=true,yb_enable_read_committed_isolation=true,enable_deadlock_detection=true,enable_wait_queues=true" --master_flags="ysql_enable_packed_row=true"

sleep 5

# Start 3rd node
printf "\nStarting node 3...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted start --advertise_address 127.0.0.3 --base_dir=$BASEDIR/node3 --cloud_location cloud.region1.node3 --fault_tolerance=zone --join=127.0.0.1 --tserver_flags="ysql_enable_packed_row=true,ysql_beta_features=true,yb_enable_read_committed_isolation=true,enable_deadlock_detection=true,enable_wait_queues=true" --master_flags="ysql_enable_packed_row=true"

# Wait a bit
printf "\nFinishing up, please wait 20 seconds...\n"
sleep 20

# Set data placement policy
$BASEDIR/yugabyte-2.19.2.0/bin/yugabyted configure data_placement --fault_tolerance=zone --base_dir=$BASEDIR/node1

# Check connectivity to each node
until $BASEDIR/yugabyte-2.19.2.0/postgres/bin/pg_isready -h 127.0.0.1 -p 5433 ; do sleep 1 ; done
until $BASEDIR/yugabyte-2.19.2.0/postgres/bin/pg_isready -h 127.0.0.2 -p 5433 ; do sleep 1 ; done
until $BASEDIR/yugabyte-2.19.2.0/postgres/bin/pg_isready -h 127.0.0.3 -p 5433 ; do sleep 1 ; done

# Verify 3 nodes are up!
printf "\nYugabyteDB Universe...\n"
$BASEDIR/yugabyte-2.19.2.0/bin/ysqlsh -h 127.0.0.1 -c "SELECT host, node_type, cloud, region, zone FROM yb_servers() ORDER BY host;"

exit

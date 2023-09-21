# Mac Version
# Doc reference: https://docs.yugabyte.com/preview/quick-start/

# Python must be installed!
# To get Python: https://www.python.org/downloads/
# Might need to add a symbolic link?
#   ln -s -f /usr/local/bin/python3 /usr/local/bin/python
# Verify: python --version

# Download YB for Mac
printf "\nDownloading YugabyteDB...\n"
curl -O https://downloads.yugabyte.com/releases/2.19.2.0/yugabyte-2.19.2.0-b121-darwin-x86_64.tar.gz

# Extract Tarball
printf "\nExtracting Tarball...\n"
tar xfz yugabyte-2.19.2.0-b121-darwin-x86_64.tar.gz

# Enable additional loopback addresses: 
sudo ifconfig lo0 alias 127.0.0.2 up
sudo ifconfig lo0 alias 127.0.0.3 up

# Start primary node
printf "\nStarting primary node...\n"
$PWD/yugabyte-2.19.2.0/bin/yugabyted start --advertise_address 127.0.0.1 --base_dir=$PWD/node1 --cloud_location onprem.dc1.az1 --fault_tolerance=zone --tserver_flags="ysql_enable_packed_row=true,ysql_beta_features=true,stream_compression_algo=3,yb_enable_read_committed_isolation=true,enable_deadlock_detection=true,enable_wait_queues=true" --master_flags="ysql_enable_packed_row=true,ysql_beta_features=true,transaction_tables_use_preferred_zones=true"

until $PWD/yugabyte-2.19.2.0/postgres/bin/pg_isready -h 127.0.0.1 -p 5433 ; do sleep 1 ; done

# Start 2nd node
printf "\nStarting node 2...\n"
$PWD/yugabyte-2.19.2.0/bin/yugabyted start --advertise_address 127.0.0.2 --base_dir=$PWD/node2 --cloud_location onprem.dc1.az2 --fault_tolerance=zone --join=127.0.0.1 --tserver_flags="ysql_enable_packed_row=true,ysql_beta_features=true,stream_compression_algo=3,yb_enable_read_committed_isolation=true,enable_deadlock_detection=true,enable_wait_queues=true" --master_flags="ysql_enable_packed_row=true,ysql_beta_features=true,transaction_tables_use_preferred_zones=true"

until $PWD/yugabyte-2.19.2.0/postgres/bin/pg_isready -h 127.0.0.2 -p 5433 ; do sleep 1 ; done

# Start 3rd node
printf "\nStarting node 3...\n"
$PWD/yugabyte-2.19.2.0/bin/yugabyted start --advertise_address 127.0.0.3 --base_dir=$PWD/node3 --cloud_location onprem.dc1.az3 --fault_tolerance=zone --join=127.0.0.1 --tserver_flags="ysql_enable_packed_row=true,ysql_beta_features=true,stream_compression_algo=3,yb_enable_read_committed_isolation=true,enable_deadlock_detection=true,enable_wait_queues=true" --master_flags="ysql_enable_packed_row=true,ysql_beta_features=true,transaction_tables_use_preferred_zones=true"

until $PWD/yugabyte-2.19.2.0/postgres/bin/pg_isready -h 127.0.0.3 -p 5433 ; do sleep 1 ; done

# Verify 3 nodes are up! 
printf "\nYugabyteDB Universe...\n"
$PWD/yugabyte-2.19.2.0/bin/ysqlsh -h 127.0.0.1 -c "SELECT host, node_type, cloud, region, zone FROM yb_servers() ORDER BY host;"

exit
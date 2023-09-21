# Mac Version
# Doc reference: https://docs.yugabyte.com/preview/reference/configuration/yugabyted/#stop 

# Stop nodes...
printf "\nStopping nodes...\n"
$PWD/yugabyte-2.19.2.0/bin/yugabyted stop --base_dir=$PWD/node1
$PWD/yugabyte-2.19.2.0/bin/yugabyted stop --base_dir=$PWD/node2
$PWD/yugabyte-2.19.2.0/bin/yugabyted stop --base_dir=$PWD/node3

exit

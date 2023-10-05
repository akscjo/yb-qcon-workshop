# Docker compose example to Start 3 node yugabyted cluster and Workload Simulator
You can accomplish following items using this example:
1. Start a 3 node YugabyteDB cluster.
2. Start a [Workload Simulator application](https://github.com/YugabyteDB-Samples/yb-workload-simulator) which will connect to the YugabyteDB cluster.
3. Using Workload Simulator application, you can run a create the database tables, see data, and run read/write simulations.
4. You will be able to scale the cluster from 3 nodes to 6 nodes using provided script - scale-cluster.sh
5. Users can test the fault tolerance by stopping any nodes and watch the latency and throughput metrics in real time.

## Prerequisites
1. [Docker](https://docs.docker.com/engine/install/)
2. [Docker Compose](https://docs.docker.com/compose/install/)

## How to run
1. Clone this repository
2. Run the following command to start the cluster and workload simulator application
    ```
    ./start.sh
    ```
   This will start a 3 node YugabyteDB cluster and Workload Simulator application.

   <img width="969" alt="Screenshot 2023-09-20 at 2 37 16 PM" src="https://github.com/yugabyte/yb-docker-examples/assets/92008321/d247ee01-fc23-46cd-ae96-6f5411cc5079">

   You can access the YugabyteDB cluster at http://localhost:15433
   <img width="1768" alt="Screenshot 2023-09-20 at 2 37 48 PM" src="https://github.com/yugabyte/yb-docker-examples/assets/92008321/fba3e996-bf0c-46ff-b292-a2281303b0c2">

   
   You can access the Workload Simulator application at http://localhost:8080
   <img width="1720" alt="Screenshot 2023-09-20 at 2 38 13 PM" src="https://github.com/yugabyte/yb-docker-examples/assets/92008321/78d676f3-38d1-49ec-aa79-b97348f7bc31">

   Create database tables from the Workload Simulator UI:
    <img width="863" alt="Screenshot 2023-09-20 at 2 38 29 PM" src="https://github.com/yugabyte/yb-docker-examples/assets/92008321/3bbb6749-aef2-4029-bee8-57aa1b559154">
   Seed Data:
    <img width="639" alt="Screenshot 2023-09-20 at 2 38 47 PM" src="https://github.com/yugabyte/yb-docker-examples/assets/92008321/4c42e486-c763-4a59-bdc7-4501e505ae76">
   Run Simulation:
   <img width="821" alt="Screenshot 2023-09-20 at 2 39 15 PM" src="https://github.com/yugabyte/yb-docker-examples/assets/92008321/cca8e950-6b04-4731-b722-d6b9c71469b2">

   <img width="1709" alt="Screenshot 2023-09-20 at 2 40 16 PM" src="https://github.com/yugabyte/yb-docker-examples/assets/92008321/6a5ed67a-9c70-44d8-951d-5d0c76cf6738">

    
   


4. For scaling the cluster, simply run the following command
    ```
    ./scale-cluster.sh
    ```
   This will scale the cluster from 3 nodes to 6 nodes.

   <img width="467" alt="Screenshot 2023-09-20 at 2 53 24 PM" src="https://github.com/yugabyte/yb-docker-examples/assets/92008321/9339f9fa-be60-4b6b-8a37-fa91adfcd285">

   <img width="1670" alt="Screenshot 2023-09-20 at 2 53 41 PM" src="https://github.com/yugabyte/yb-docker-examples/assets/92008321/6f576c77-2cb5-4b1c-b747-7a27daf51f47">

   <img width="1700" alt="Screenshot 2023-09-20 at 2 53 54 PM" src="https://github.com/yugabyte/yb-docker-examples/assets/92008321/f3dd6074-86ab-47d7-9808-2d19c03ed805">

5. For Resiliency testing, you can stop one of the database cluster container (I am doing that from docket UI client on mac in below example):
   
   <img width="994" alt="Screenshot 2023-09-20 at 2 58 50 PM" src="https://github.com/yugabyte/yb-docker-examples/assets/92008321/d0d8b4e7-7796-4582-a18e-2390a7ea7088">
    It will remove yugabyted-4 node.
   <img width="922" alt="Screenshot 2023-09-20 at 3 01 58 PM" src="https://github.com/yugabyte/yb-docker-examples/assets/92008321/666a11f2-5c9b-4527-bea5-d6f8e9e693b0">
    <img width="1501" alt="Screenshot 2023-09-20 at 3 02 37 PM" src="https://github.com/yugabyte/yb-docker-examples/assets/92008321/37514bd1-fe39-4aad-86a7-a7965f0f3201">


6. When you are done, you can shutdown the cluster and workload simulator application by running the following command
    ```
    ./shutdown.sh
    ```
    <img width="783" alt="Screenshot 2023-09-20 at 3 04 44 PM" src="https://github.com/yugabyte/yb-docker-examples/assets/92008321/cfcdef9e-cf1e-493e-b3e9-e8c2974ee387">

7. Workload Simulator App is customizable App. You can find more details regarding environment variables, etc [here] (https://github.com/YugabyteDB-Samples/yb-workload-simulator)
8. If you would like to pass any new gflags to your "yugabyted", this [link](https://docs.yugabyte.com/preview/reference/configuration/yugabyted/) provides configuration details.

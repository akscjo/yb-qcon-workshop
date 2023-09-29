## Simulator Application
We are going to use this app to call the API and generate data.

```sh 
./start-simulator.sh
```
or

```sh
java -jar yb-workload-sim.jar
```

The application will start on port 9090. You can access the UI at http://localhost:9090

It is highly customizable, you can change the workload, the number of threads, the number of operations, etc. You can also override the parameters to point to a different workloads. See Github repo for more details:
https://github.com/YugabyteDB-Samples/yb-workload-simulator



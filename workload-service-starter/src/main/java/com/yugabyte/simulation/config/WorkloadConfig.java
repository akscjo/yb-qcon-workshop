package com.yugabyte.simulation.config;

import com.yugabyte.simulation.service.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class WorkloadConfig {
    @Bean(name="ExampleWorkload")
    public WorkloadSimulation quikShipWorkload(){
        return new ExampleWorkload();
    }

    @Bean(name="QconWorkload")
    public WorkloadSimulation qconWorkload(){
        return new QconWorkload();
    }
}

package com.yugabyte.simulation.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;

@Configuration
public class DatasourceConfig {
    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.hikari")
    public HikariConfig hikariConfig() {
    	HikariConfig config = new HikariConfig();
    	return config;
    }

    @Bean
    @Primary // may not be required
    public DataSource dataSource() {
    	HikariDataSource ds = new HikariDataSource(hikariConfig());
    	return ds;
    }
}
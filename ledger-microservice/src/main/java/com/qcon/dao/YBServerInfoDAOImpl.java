package com.qcon.dao;

import com.qcon.model.YBServerModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class YBServerInfoDAOImpl implements YBServerInfoDAO{
    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public List<YBServerModel> getAll() {
    	String query = "select host,port,cloud,region,zone from yb_servers()";
        return jdbcTemplate.query(query, new BeanPropertyRowMapper<YBServerModel>(YBServerModel.class));
    }
}

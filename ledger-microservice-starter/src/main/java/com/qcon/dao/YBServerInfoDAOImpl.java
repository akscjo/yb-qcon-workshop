package com.qcon.dao;

import com.qcon.model.YBServerModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class YBServerInfoDAOImpl implements YBServerInfoDAO{
    @Autowired
    JdbcTemplate jdbcTemplate;

    @Override
    public List<YBServerModel> getAll() {
        //TODO: Implement me
        return null;
    }
}

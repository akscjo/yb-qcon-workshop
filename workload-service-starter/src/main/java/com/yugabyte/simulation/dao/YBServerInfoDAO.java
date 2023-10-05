package com.yugabyte.simulation.dao;

import com.yugabyte.simulation.model.YBServerModel;

import java.util.List;

public interface YBServerInfoDAO {
    List<YBServerModel> getAll();
}

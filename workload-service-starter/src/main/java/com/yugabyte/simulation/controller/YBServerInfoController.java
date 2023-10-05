package com.yugabyte.simulation.controller;

import com.yugabyte.simulation.dao.YBServerInfoDAO;
import com.yugabyte.simulation.model.YBServerModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class YBServerInfoController {
    @Autowired
    private YBServerInfoDAO ybServerInfoDAO;

    @GetMapping("/api/ybserverinfo")
    public List<YBServerModel> getYBServerInfo(){
        // TODO: implement this
        return null;
    }

    @GetMapping("/api/ybserverinfo/{target}")
    public List<YBServerModel> getYBServerInfo(@PathVariable(name = "target", required =  true) String target){
        // TODO: implement this
        return null;
    }
}


package com.yugabyte.simulation.controller;

import com.yugabyte.simulation.dao.YBServerInfoDAO;
import com.yugabyte.simulation.model.YBServerModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class YBServerInfoController {
    @Autowired
    private YBServerInfoDAO ybServerInfoDAO;

	@Value("${ybm.pulltopologyfromapi}")
	private boolean pullTopologyFromApi;



    @GetMapping("/api/ybserverinfo")
    public List<YBServerModel> getYBServerInfo(){
    	return ybServerInfoDAO.getAll();
    }

    @GetMapping("/api/ybserverinfo/{target}")
    public List<YBServerModel> getYBServerInfo(@PathVariable(name = "target", required =  true) String target){
    	switch (target) {
    	case "YBA":
			return ybServerInfoDAO.getAll();
		default:
	    	return ybServerInfoDAO.getAll();
    	}
    }

    private volatile boolean hasNode6 = true;
    @GetMapping("/api/node6visible/{visible}")
    public void setNode6Visible(@PathVariable(name = "visible")boolean isVisible) {
    	this.hasNode6 = isVisible;
    }
}


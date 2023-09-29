package com.qcon.controller;

import com.qcon.dao.YBServerInfoDAO;
import com.qcon.model.YBServerModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class YBServerInfoController {
    @Autowired
    private YBServerInfoDAO ybServerInfoDAO;



    @GetMapping("/ybserverinfo")
    public List<YBServerModel> getYBServerInfo(){
    	return ybServerInfoDAO.getAll();
    }


}

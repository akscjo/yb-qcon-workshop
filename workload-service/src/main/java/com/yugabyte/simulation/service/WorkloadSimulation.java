package com.yugabyte.simulation.service;

import com.yugabyte.simulation.dao.InvocationResult;
import com.yugabyte.simulation.dao.ParamValue;
import com.yugabyte.simulation.dao.WorkloadDesc;

import java.util.List;

public interface WorkloadSimulation {
	public List<WorkloadDesc> getWorkloads();
	public default InvocationResult invokeWorkload(String workloadId, ParamValue[] value) {return null;};
	public String getName();
}

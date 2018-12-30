package com.os.service;

import com.os.pojo.O_Resource;
import com.os.utils.BootStrapTable;
import com.os.utils.ResultMap;

public interface ResourceService {

	public ResultMap add(O_Resource r);
	
	public  BootStrapTable getResourceData(BootStrapTable bst);
	
	public ResultMap deletes(String  ids);
}

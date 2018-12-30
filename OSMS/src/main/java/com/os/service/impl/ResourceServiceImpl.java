package com.os.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.os.dao.ResourceDao;
import com.os.pojo.O_Resource;
import com.os.service.ResourceService;
import com.os.utils.BootStrapTable;
import com.os.utils.DateConvert;
import com.os.utils.ResultMap;
import com.os.vo.ResourceVO;

@Service("resourceService")
public class ResourceServiceImpl implements  ResourceService{

	@Autowired
	private ResourceDao resourceDao;
	
	@Override
	public ResultMap add(O_Resource r) {
		// TODO Auto-generated method stub
		ResultMap m = new ResultMap();
		String rName = r.getResourceName();
		String rType =  rName.substring(rName.indexOf(".")+1);
		r.setResourceType(rType);
		r.setResourceTime(new Date());
		int flag = resourceDao.insertSelective(r);
		if(flag > 0){
			m.setResultType("1");
			m.setResultContent("添加成功");
		}else{
			m.setResultType("0");
			m.setResultContent("添加失败");
		}
		return m;
	}

	@Override
	public BootStrapTable getResourceData(BootStrapTable bst) {
		// TODO Auto-generated method stub
				BootStrapTable resultBST =  new BootStrapTable();
				List  returnList = new ArrayList();
				List<O_Resource> rList = resourceDao.selectAll(bst);
				for(O_Resource r:rList){
					ResourceVO rVo = new ResourceVO();
					BeanUtils.copyProperties(r, rVo, new String[]{"resourceTime"});
					rVo.setrTimeStr(DateConvert.dateToString(r.getResourceTime()));
					returnList.add(rVo);
				}
				resultBST.setRows(returnList);
				resultBST.setTotal(resourceDao.getTotal());
				return resultBST;
			}

	@Override
	public ResultMap deletes(String ids) {
		// TODO Auto-generated method stub
				ResultMap resultMap = new ResultMap();
				List idList = new ArrayList();
				String [] idStr = ids.split(",");
				for(int i = 0;i<idStr.length;i++) {
					idList.add(Integer.valueOf(idStr[i]));
				}
				int flag = resourceDao.deletes(idList);
				
				if(flag > 0){
					resultMap.setResultType("1");
				}else{
					resultMap.setResultType("0");
				}
				return resultMap;
			}

}

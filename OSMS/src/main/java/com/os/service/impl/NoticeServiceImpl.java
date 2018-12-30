package com.os.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.os.dao.NoticeDao;
import com.os.pojo.O_Notice;
import com.os.service.NoticeService;
import com.os.utils.BootStrapTable;
import com.os.utils.DateConvert;
import com.os.utils.ResultMap;
import com.os.vo.NoticeVo;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;

	@Override
	public BootStrapTable getNoticeData(BootStrapTable bst) {
		// TODO Auto-generated method stub
		BootStrapTable resultBST =  new BootStrapTable();
		List  returnList = new ArrayList();
		List<O_Notice> noticeList = noticeDao.selectAll(bst);
		for(O_Notice n:noticeList){
			NoticeVo noticeVo = new NoticeVo();
			BeanUtils.copyProperties(n, noticeVo, new String[]{"nTime"});
			noticeVo.setnTimeStr(DateConvert.dateToString(n.getnTime()));
			returnList.add(noticeVo);
		}
		resultBST.setRows(returnList);
		resultBST.setTotal(noticeDao.getTotal());
		return resultBST;
	}

	@Override
	public ResultMap addNotice(O_Notice n) {
		// TODO Auto-generated method stub
		ResultMap resultMap = new ResultMap();
		n.setnTime(new Date());
		int flag = noticeDao.insertSelective(n);
		if(flag > 0){
			resultMap.setResultType("1");
		}else{
			resultMap.setResultType("0");
		}
		return resultMap;
	}

	@Override
	public void showTeachInfoDetail(HttpServletRequest request, int nId) {
		// TODO Auto-generated method stub
		O_Notice notice = noticeDao.selectByPrimaryKey(nId);
		request.setAttribute("n", notice);
	}

	@Override
	public ResultMap updateNotice(O_Notice n) {
		// TODO Auto-generated method stub
		ResultMap resultMap = new ResultMap();
		int flag = noticeDao.updateByPrimaryKeySelective(n);
		if(flag > 0){
			resultMap.setResultType("1");
		}else{
			resultMap.setResultType("0");
		}
		return resultMap;
	}

	@Override
	public ResultMap deleteNotices(String ids) {
		// TODO Auto-generated method stub
		ResultMap resultMap = new ResultMap();
		List idList = new ArrayList();
		String [] idStr = ids.split(",");
		for(int i = 0;i<idStr.length;i++) {
			idList.add(Integer.valueOf(idStr[i]));
		}
		int flag = noticeDao.deleteNotices(idList);
		
		if(flag > 0){
			resultMap.setResultType("1");
		}else{
			resultMap.setResultType("0");
		}
		return resultMap;
	}

	@Override
	public BootStrapTable getLastNoticeData() {
		// TODO Auto-generated method stub
				BootStrapTable resultBST =  new BootStrapTable();
				List  returnList = new ArrayList();
				List<O_Notice> noticeList = noticeDao.selectLast();
				for(O_Notice n:noticeList){
					NoticeVo noticeVo = new NoticeVo();
					BeanUtils.copyProperties(n, noticeVo, new String[]{"nTime"});
					noticeVo.setnTimeStr(DateConvert.dateToString(n.getnTime()));
					returnList.add(noticeVo);
				}
				resultBST.setRows(returnList);
				return resultBST;
			}
	
}

package com.os.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.os.dao.QuestionDao;
import com.os.dao.ReplyDao;
import com.os.pojo.O_Question;
import com.os.pojo.O_Reply;
import com.os.pojo.O_User;
import com.os.service.ReplyService;
import com.os.utils.CheckLoginStatus;
import com.os.utils.DateConvert;
import com.os.utils.ResultMap;
import com.os.vo.ReplyVo;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDao replyDao;
	
	@Autowired
	private QuestionDao questionDao;
	
	@Override
	public ResultMap sendReply(HttpServletRequest request, O_Reply reply) {
		// TODO Auto-generated method stub
		CheckLoginStatus checkLoginStatus = new CheckLoginStatus(request);
		ResultMap resultMap = new ResultMap();
		if(!checkLoginStatus.isLogin()){
			resultMap.setResultType("0");
			resultMap.setResultContent("未登录");
		}else{
		O_User loginUser = checkLoginStatus.getUsers();
		reply.setrUId(loginUser.getuId());
		reply.setrTime(new Date());
		int flag = replyDao.insertSelective(reply);
		if(flag > 0){
			resultMap.setResultType("1");
			resultMap.setResultContent("添加成功");
		}else{
			resultMap.setResultType("0");
			resultMap.setResultContent("添加失败");
		}
	}
		return resultMap;
}

	@Override
	public List<ReplyVo> getReplyData(O_Reply reply) {
		// TODO Auto-generated method stub
		List<O_Reply> replyList = replyDao.getDataByQId(reply.getrQId());
		List<ReplyVo> replyVOList = new ArrayList<ReplyVo>();
		for(O_Reply replyPO:replyList){
			ReplyVo replyVO = new ReplyVo();
			BeanUtils.copyProperties(replyPO, replyVO, new String[]{"rTime"});
			replyVO.setrTimeStr(DateConvert.dateToString(replyPO.getrTime()));
			replyVOList.add(replyVO);
		}
		return replyVOList;
	}

	@Override
	public int getReplyCountByQId(int qId) {
		// TODO Auto-generated method stub
		
		return replyDao.selectReplyCountByQId(qId);
	}

	@Override
	public ResultMap replyStudent(HttpServletRequest request,O_Reply reply) {
		// TODO Auto-generated method stub
		O_Question q = questionDao.selectByPrimaryKey(reply.getrQId());
		q.setqState(1);
		questionDao.updateByPrimaryKeySelective(q);
		CheckLoginStatus checkLoginStatus = new CheckLoginStatus(request);
		O_User u = checkLoginStatus.getUsers();
		reply.setrUId(u.getuId());
		reply.setrTime(new Date());
		replyDao.insertSelective(reply);
		ResultMap resultMap = new ResultMap();
		resultMap.setResultType("1");
		return resultMap;
	}

	@Override
	public List<ReplyVo> getReplyDataByUser(HttpServletRequest request) {
		// TODO Auto-generated method stub
		CheckLoginStatus checkLoginStatus = new CheckLoginStatus(request);
		List<O_Reply> replyList = replyDao.getDataByUser(checkLoginStatus.getUsers().getuId());
		List<ReplyVo> replyVOList = new ArrayList<ReplyVo>();
		for(O_Reply replyPO:replyList){
				ReplyVo replyVO = new ReplyVo();
				BeanUtils.copyProperties(replyPO, replyVO, new String[]{"rTime"});
				replyVO.setrTimeStr(DateConvert.dateToString(replyPO.getrTime()));
				replyVOList.add(replyVO);
		}
		return replyVOList;
	}

	@Override
	public ResultMap deleteReply(O_Reply reply) {
		// TODO Auto-generated method stub
		ResultMap resultMap = new ResultMap();
		int flag = replyDao.deleteByPrimaryKey(reply.getrId());
		if(flag > 0){
			resultMap.setResultType("1");
		}else{
			resultMap.setResultType("0");
		}
		return resultMap;
	}
	
}

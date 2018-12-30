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
import com.os.dao.UserDao;
import com.os.pojo.O_Question;
import com.os.pojo.O_User;
import com.os.service.QuestionService;
import com.os.utils.BootStrapTable;
import com.os.utils.CheckLoginStatus;
import com.os.utils.DateConvert;
import com.os.utils.ResultMap;
import com.os.vo.QuestionVo;

@Service("questionService")
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionDao questionDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private ReplyDao replyDao;
	
	@Override
	public ResultMap addStudentQuestion(HttpServletRequest request, O_Question o_Question) {
		// TODO Auto-generated method stub
		CheckLoginStatus checkLoginStatus = new CheckLoginStatus(request);
		ResultMap resultMap = new ResultMap();
		if(checkLoginStatus.isLogin()){
			O_User loginUserInfo = checkLoginStatus.getUsers();
			o_Question.setqUid(loginUserInfo.getuId());
			o_Question.setqTime(new Date());
			o_Question.setqReplyCount(0);
			o_Question.setqState(0);
			o_Question.setqType(0);
			o_Question.setqViewCount(0);
			int respect = questionDao.insertSelective(o_Question);
			if(respect > 0){
				resultMap.setResultType("1");
				resultMap.setResultContent("添加成功");
			}else{
				resultMap.setResultType("0");
				resultMap.setResultContent("添加失败");
			}
		}else{
			resultMap.setResultType("0");
			resultMap.setResultContent("未登录");
		}
		return resultMap;
	}

	@Override
	public BootStrapTable getStudentQuestionData(BootStrapTable bst) {
		// TODO Auto-generated method stub
		BootStrapTable result = new BootStrapTable();
		List qList = new ArrayList();
		bst.setStart(bst.getOffset()*bst.getLimit());
		int total = questionDao.getTotalByType(bst);
		List<O_Question> rows = questionDao.getStudentQuestions(bst);
		for(O_Question q:rows){
			QuestionVo qvo = new QuestionVo();
			BeanUtils.copyProperties(q, qvo,new String[]{"qTime"});
			qvo.setqTimeStr(DateConvert.dateToString(q.getqTime()));
			qList.add(qvo);
		}
		result.setTotal(total);
		result.setRows(qList);
		return result;
	}

	@Override
	public void showAQuestion(HttpServletRequest request,int qId) {
		// TODO Auto-generated method stub
		O_Question question = questionDao.selectByPrimaryKey(qId);
		QuestionVo questionVo = new QuestionVo();
		BeanUtils.copyProperties(question, questionVo, new String[]{"qTime"});
		questionVo.setqTimeStr(DateConvert.dateToString(question.getqTime()));
		request.setAttribute("question", questionVo);
		O_User askUser = userDao.selectByPrimaryKey(question.getqUid());
		question.setqViewCount(question.getqViewCount()+1);
		questionDao.updateByPrimaryKeySelective(question);
		request.setAttribute("askUser", askUser);
	}

	@Override
	public ResultMap addTeacherQuestion(HttpServletRequest request, O_Question o_Question) {
		// TODO Auto-generated method stub
				CheckLoginStatus checkLoginStatus = new CheckLoginStatus(request);
				ResultMap resultMap = new ResultMap();
				if(checkLoginStatus.isLogin()){
					O_User loginUserInfo = checkLoginStatus.getUsers();
					o_Question.setqUid(loginUserInfo.getuId());
					o_Question.setqTime(new Date());
					o_Question.setqReplyCount(0);
					o_Question.setqState(0);
					o_Question.setqType(1);
					o_Question.setqViewCount(0);
					int respect = questionDao.insertSelective(o_Question);
					if(respect > 0){
						resultMap.setResultType("1");
						resultMap.setResultContent("添加成功");
					}else{
						resultMap.setResultType("0");
						resultMap.setResultContent("添加失败");
					}
				}else{
					resultMap.setResultType("0");
					resultMap.setResultContent("未登录");
				}
				return resultMap;
			}

	@Override
	public BootStrapTable getTeacherQuestionData(BootStrapTable bst) {
		// TODO Auto-generated method stub
				BootStrapTable result = new BootStrapTable();
				List qList = new ArrayList();
				bst.setStart(bst.getOffset()*bst.getLimit());
				int total = questionDao.getTotal(bst);
				List<O_Question> rows = questionDao.getTeacherQuestions(bst);
				for(O_Question q:rows){
					QuestionVo qvo = new QuestionVo();
					BeanUtils.copyProperties(q, qvo,new String[]{"qTime"});
					qvo.setqTimeStr(DateConvert.dateToString(q.getqTime()));
					qList.add(qvo);
				}
				result.setTotal(total);
				result.setRows(qList);
				return result;
			}

	@Override
	public ResultMap confirmBestResult(int qId, int rId) {
		// TODO Auto-generated method stub
		ResultMap resultMap = new ResultMap();
		O_Question q = questionDao.selectByPrimaryKey(qId);
		q.setqRid(rId);
		q.setqState(1);
		int flag = questionDao.updateByPrimaryKeySelective(q);
		if(flag > 0){
			resultMap.setResultType("1");
		}else{
			resultMap.setResultType("0");
		}
		return resultMap;
	}

	@Override
	public BootStrapTable getStudentQuestionByUser(BootStrapTable bst, HttpServletRequest request) {
		// TODO Auto-generated method stub
		CheckLoginStatus checkLoginStatus = new CheckLoginStatus(request);
		BootStrapTable result = new BootStrapTable();
		List qList = new ArrayList();
		O_User u = checkLoginStatus.getUsers();
		bst.setuId(u.getuId());
		List<O_Question> rows = questionDao.getQuestionsByUser(bst);
		for(O_Question q:rows){
			QuestionVo qvo = new QuestionVo();
			BeanUtils.copyProperties(q, qvo,new String[]{"qTime"});
			qvo.setqTimeStr(DateConvert.dateToString(q.getqTime()));
			qList.add(qvo);
		}
		result.setTotal(questionDao.getTotalByUser(bst));
		result.setRows(qList);
		return result;
	}

	@Override
	public ResultMap deleteQuestionByUser(HttpServletRequest request, O_Question o_Question) {
		// TODO Auto-generated method stub
		ResultMap resultMap = new ResultMap();
		CheckLoginStatus checkLoginStatus = new CheckLoginStatus(request);
		O_User u = checkLoginStatus.getUsers();
		o_Question.setqUid(u.getuId());
		questionDao.deleteByPrimaryKey(o_Question.getqId());
		replyDao.deleteByUser(o_Question);
		resultMap.setResultType("1");
		return resultMap;
	}
	

}

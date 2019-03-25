package top.tsep.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.tsep.dao.QuestionDao;
import top.tsep.dao.SubjectDao;
import top.tsep.dao.UserDao;
import top.tsep.pojo.QuestionEntity;
import top.tsep.pojo.SubjectEntity;
import top.tsep.pojo.UserEntity;
import top.tsep.service.QuestionService;
import top.tsep.utils.ResultMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Service("questionService")
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionDao questionDao;

	private HttpServletRequest mRequest;
	

	public ResultMap save(Map<String, Object> parameter) {
		ResultMap r = new ResultMap();
		QuestionEntity q = new QuestionEntity();
		String title = parameter.get("title").toString();
		q.setTitle(title);
		q.setTag(parameter.get("tag").toString());
		q.setContent(parameter.get("content").toString());
		HttpSession session = mRequest.getSession();
		q.setUserId(((UserEntity)session.getAttribute( "SESSION_USER" )).getId());
		r.setResultType("0000");
		r.setResultContent("注册成功");
		return r;
	}
}

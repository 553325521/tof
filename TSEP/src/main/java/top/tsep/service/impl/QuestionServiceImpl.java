package top.tsep.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.tsep.dao.QuestionDao;
import top.tsep.pojo.QuestionEntity;
import top.tsep.pojo.UserEntity;
import top.tsep.service.QuestionService;
import top.tsep.utils.CheckLoginStatus;
import top.tsep.utils.ResultMap;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service("questionService")
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionDao questionDao;

	public ResultMap save(Map<String, Object> parameter,HttpServletRequest request) {
		ResultMap r = new ResultMap();
		QuestionEntity q = new QuestionEntity();
		if(parameter.get("title").equals("") || parameter.get("title") != null) {
			String title = parameter.get("title").toString();
			q.setTitle(title);
		}
		if(parameter.get("tag").equals("")|| parameter.get("tag")!=null) {
			q.setTag(parameter.get("tag").toString());
		}
		if(parameter.get("classify").equals("")|| parameter.get("classify")!=null) {
			q.setClassify(parameter.get("classify").toString());
		}
		if(parameter.get("difficult").equals("")||parameter.get("difficult")!=null) {
			q.setDifficult(parameter.get("difficult").toString());
		}
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createtime = sd.format(new Date());
		q.setCreatTime(createtime);
		if(parameter.get("content").equals("")||parameter.get("content")!=null) {
			q.setContent(parameter.get("content").toString());
		}
		CheckLoginStatus checkLoginStatus = new CheckLoginStatus(request);
		UserEntity u = checkLoginStatus.getUsers();
		q.setUserId(u.getId());
		q.setSubjectId(Integer.parseInt(u.getAttribute2()));
		questionDao.insertSelective(q);
		r.setResultType("0000");
		r.setResultContent("发表成功");
		return r;
	}

	public List<QuestionEntity> selectBysubjectId(Integer subjectId){
		return questionDao.selectBysubjectId(subjectId);
	}
}

package top.tsep.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import top.tsep.dao.CommentDao;
import top.tsep.pojo.CommentEntity;
import top.tsep.pojo.UserEntity;
import top.tsep.service.CommentService;
import top.tsep.utils.CheckLoginStatus;
import top.tsep.utils.ResultMap;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDao commentDao;

	public ResultMap save(Map<String, Object> parameter,HttpServletRequest request) {
		ResultMap r = new ResultMap();
		CommentEntity c = new CommentEntity();
		if(parameter.get("qId").equals("") || parameter.get("qId") != null) {
			String qId = parameter.get("qId").toString();
			c.setQuestionId(Integer.parseInt(qId));
		}
		CheckLoginStatus checkLoginStatus = new CheckLoginStatus(request);
		UserEntity u = checkLoginStatus.getUsers();
		c.setUserId(u.getId());
		if(parameter.get("comment").equals("") || parameter.get("comment") != null) {
			String content = parameter.get("comment").toString();
			c.setContent(content);
		}
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createtime = sd.format(new Date());
		c.setCreateTime(createtime);
		commentDao.insertSelective(c);
		r.setResultType("0000");
		r.setResultContent("发表成功");
		return r;
	}

	public List<CommentEntity> selectByQuestionId(Integer qId){
	    return commentDao.selectByQuestionId(qId);
    }
}

package top.tsep.service.impl;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.tsep.dao.SubjectDao;
import top.tsep.dao.UserDao;
import top.tsep.pojo.SubjectEntity;
import top.tsep.pojo.UserEntity;
import top.tsep.service.UserService;
import top.tsep.utils.CheckLoginStatus;
import top.tsep.utils.ResultMap;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private SubjectDao subjectDao;
	
	@Autowired
	private UserDao userDao;
	
	@Override
	public ResultMap register(Map<String, Object> parameter) {
		ResultMap r = new ResultMap();
		UserEntity u = new UserEntity();
		String type = parameter.get("userType").toString();
		String subjectName = parameter.get("subjectName").toString();
		SubjectEntity s = subjectDao.selectByName(subjectName);
		u.setNickName(parameter.get("nickName").toString());
		u.setPassWord(parameter.get("password").toString());
		u.setRealName(parameter.get("realName").toString());
		u.setEmail(parameter.get("email").toString());
		u.setUserIntro(null);
		u.setUserPhone(null);
		u.setUserQq(null);
		u.setUserTx(parameter.get("userTx").toString());
		u.setAttribute1("0");
		if(type.equals("0")){
			if(s == null){
				r.setResultType("9999");
				r.setResultContent("注册科目不存在");
				return r;
			}else{
				u.setUserType("0");
				userDao.insertSelective(u);
				int subjectId  = s.getId();
				userDao.insertUserSubject(u.getId(), subjectId);
			}
		}else{
			if(s == null){
				s = new SubjectEntity();
				s.setSubjectName(subjectName);
				subjectDao.insertSelective(s);
				u.setUserType("1");
				userDao.insertSelective(u);
				userDao.insertUserSubject(u.getId(), s.getId());
			}else{
				u.setUserType("1");
				userDao.insertSelective(u);
				userDao.insertUserSubject(u.getId(), s.getId());
			}
		}
		r.setResultType("0000");
		r.setResultContent("注册成功");
		return r;
	}

	@Override
	public ResultMap login(UserEntity user,HttpServletRequest request) {
		ResultMap r = new ResultMap();
		CheckLoginStatus checkLoginStatus = new CheckLoginStatus(request);
		if(checkLoginStatus.isLogin()){
			r.setResultType("0000");
			r.setResultContent("该用户已登录");
		}else{
			UserEntity u = userDao.checkLogin(user);
			if(u == null){
				r.setResultType("9999");
				r.setResultContent("邮箱或者密码不正确");
			}else{
				checkLoginStatus.putUsers(user);
				r.setResultType("0000");
				r.setResultContent("登录成功");
			}
		}
		
		return r;
	}

}

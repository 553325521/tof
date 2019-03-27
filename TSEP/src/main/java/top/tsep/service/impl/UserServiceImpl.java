package top.tsep.service.impl;

import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
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
				Map<String,Object> subject = userDao.checkSubject(u.getId(),Integer.parseInt(user.getAttribute2()));
				if(subject == null){
					r.setResultType("9999");
					r.setResultContent("选择科目不存在");
				}else{
					u.setAttribute2(subject.get("subject_id").toString());
					checkLoginStatus.putUsers(u);
					r.setResultType("0000");
					r.setResultContent("登录成功");
				}
			}
		}
		
		return r;
	}

	@Override
	public ResultMap updatePwd(UserEntity user)  {
		ResultMap r = new ResultMap();
		String email = user.getEmail();
		String uuid = String.valueOf((int)((Math.random()*9+1)*100000));
		user.setPassWord(uuid);
		int result = userDao.initPwdByEmail(user);
		if(result > 0){
			Properties properties = new Properties();
			properties.put("mail.transport.protocol", "smtp");// 连接协议
			properties.put("mail.smtp.host", "smtp.qq.com");// 主机名
			properties.put("mail.smtp.port", 465);// 端口号
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.ssl.enable", "true");// 设置是否使用ssl安全连接
			properties.put("mail.debug", "true");// 设置是否显示debug信息 true 会在控制台显示相关信息
			// 得到回话对象
			Session session = Session.getInstance(properties);
			// 获取邮件对象
			Message message = new MimeMessage(session);
			// 设置发件人邮箱地址
			try {
				message.setFrom(new InternetAddress("1393936249@qq.com"));
				// 设置收件人地址
				message.setRecipients(RecipientType.TO, new InternetAddress[] { new InternetAddress(email) });
				// 设置邮件标题
				message.setSubject("初始化密码");
				// 设置邮件内容
				message.setText("您好，您初始化后的密码为:"+uuid);
				// 得到邮差对象
				Transport transport = session.getTransport();
				// 连接自己的邮箱账户
				transport.connect("1393936249@qq.com", "mfaxeaqpldmljcjg");// 密码为刚才得到的授权码
				// 发送邮件
				transport.sendMessage(message, message.getAllRecipients());
			} catch (AddressException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			r.setResultType("0000");
			r.setResultContent("初始化密码成功");
		
		}else{
			r.setResultType("9999");
			r.setResultContent("邮箱不存在");
		}
		
		return r;
	}

}

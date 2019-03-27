package top.tsep.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import top.tsep.pojo.UserEntity;
import top.tsep.utils.ResultMap;

public interface UserService {

    /**
     * 注册用户
     */
	public ResultMap register(Map<String,Object> parameter);
	
	/**
	* <p>Title: login</p>
	* <p>Description:登录业务逻辑 </p>
	* @param user
	* @return
	*/
	public ResultMap login(UserEntity user,HttpServletRequest request);
	
	public ResultMap updatePwd(UserEntity user);
	
	public ResultMap accessChat(HttpServletRequest request);
	
}

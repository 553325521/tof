package top.tsep.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	
	public ResultMap accessChat(HttpServletRequest request,String operaton);
	
	List<UserEntity> loadUserListBySubjectId(HttpServletRequest request);
	
	/**
	* <p>Title: modifyMyInfo</p>
	* <p>Description:更新个人资料 </p>
	* @param request
	* @param user
	* @return
	*/
	UserEntity modifyMyInfo(HttpServletRequest request,UserEntity user);
	
}

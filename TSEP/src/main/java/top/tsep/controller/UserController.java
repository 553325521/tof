package top.tsep.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import top.tsep.pojo.UserEntity;
import top.tsep.service.UserService;
import top.tsep.utils.ResultMap;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/accessOrOutChat", method = RequestMethod.POST)
	@ResponseBody
	public ResultMap accessOrOutChat(HttpServletRequest request,String operation) {
		ResultMap r = userService.accessChat(request,operation);
		return r;
	}
	
	
	@RequestMapping(value = "/loadAllFriend", method = RequestMethod.POST)
	@ResponseBody
	public List<UserEntity>  accessOrOutChat(HttpServletRequest request) {
		List<UserEntity> userList = userService.loadUserListBySubjectId(request);
		return userList;
	}
	
	@RequestMapping(value = "/modifyMyInfo", method = RequestMethod.POST)
	@ResponseBody
	public UserEntity modifyMyInfo(HttpServletRequest request,UserEntity user) {
		return userService.modifyMyInfo(request, user);
	}

}

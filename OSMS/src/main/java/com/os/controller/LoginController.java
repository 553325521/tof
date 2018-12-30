package com.os.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.os.pojo.O_User;
import com.os.service.UserService;
import com.os.utils.CheckLoginStatus;
import com.os.utils.ResultMap;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;
	
	 @RequestMapping( value = "/login", method = RequestMethod.POST )
	 @ResponseBody
	public ResultMap login(HttpServletRequest request,O_User user) {
		 ResultMap resultMap = userService.checkLogin(user,request);
		return resultMap;
	}
	 @RequestMapping(value = "/loginOut")
	public String loginOut(HttpServletRequest request){
		CheckLoginStatus checkLoginStatus = new CheckLoginStatus(request);
		checkLoginStatus.removeSession();
		return "index";
	}
}

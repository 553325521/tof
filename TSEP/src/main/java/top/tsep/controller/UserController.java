package top.tsep.controller;

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
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "accessChat", method = RequestMethod.POST)
	@ResponseBody
	public ResultMap accessChat(HttpServletRequest request) {
		return null;
	}

}

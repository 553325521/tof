package top.tsep.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import top.tsep.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
	
}

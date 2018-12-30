package com.os.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.os.pojo.O_User;
import com.os.service.UserService;
import com.os.utils.ResultMap;


@Controller
@RequestMapping("/userController")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/stuRegister", method = RequestMethod.POST)
    @ResponseBody
    public ResultMap stuRegister(HttpServletRequest request, O_User user) {
        ResultMap resultMap = userService.register(user, request);
        return resultMap;
    }
}

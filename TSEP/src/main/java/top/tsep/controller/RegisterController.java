package top.tsep.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import top.tsep.pojo.SubjectEntity;
import top.tsep.service.UserService;
import top.tsep.service.SubjectService;
import top.tsep.utils.ResultMap;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("register")
public class RegisterController{

    @Autowired
    private UserService userService;

    @Autowired
    private SubjectService subjectService;

    @RequestMapping(value = "/stuRegister", method = RequestMethod.POST)
    @ResponseBody
    public ResultMap stuRegister(HttpServletRequest request) {
        ResultMap resultMap = new ResultMap();
        SubjectEntity subjectEntity =  subjectService.selectByName(request.getParameter("t_subject"));
        return resultMap;
    }
}

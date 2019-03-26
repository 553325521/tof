package top.tsep.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import top.tsep.pojo.SubjectEntity;
import top.tsep.pojo.UserEntity;
import top.tsep.service.SubjectService;
import top.tsep.service.UserService;
import top.tsep.utils.CheckLoginStatus;
import top.tsep.utils.ResultMap;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {
    @Autowired
    private SubjectService subjectService;

    @Autowired
    private UserService userService;
    
    @RequestMapping(value = "getSubject",method = RequestMethod.GET)
    @ResponseBody
    public List<SubjectEntity> getSubject(){
        List<SubjectEntity> subject = subjectService.findAllSubject();
        return subject;
    }
    
    @RequestMapping(value = "login",method = RequestMethod.POST)
    @ResponseBody
    public ResultMap login(UserEntity user,HttpServletRequest request){
        return userService.login(user, request);
    }
    
    @RequestMapping(value = "updatePwd",method = RequestMethod.POST)
    @ResponseBody
    public ResultMap updatePwd(String  email){
    	UserEntity u = new UserEntity();
    	u.setEmail(email);
        return userService.updatePwd(u);
    }
    
    @RequestMapping(value = "loginOut",method = RequestMethod.GET)
    public String loginOut(HttpServletRequest request){
    	CheckLoginStatus checkLoginStatus = new CheckLoginStatus(request);
    	checkLoginStatus.removeSession();
        return "login";
    }
}

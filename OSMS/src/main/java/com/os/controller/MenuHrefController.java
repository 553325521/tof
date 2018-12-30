package com.os.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.os.pojo.O_User;
import com.os.service.NoticeService;
import com.os.service.QuestionService;
import com.os.utils.CheckLoginStatus;

@Controller
public class MenuHrefController {

    @Autowired
    private QuestionService questionService;

    @Autowired
    private NoticeService noticeService;


    @RequestMapping("index")
    public String showIndex() {
        return "index";
    }

    @RequestMapping("showLogin")
    public String showLogin() {
        return "login";
    }

    @RequestMapping("showRegister")
    public String showRegister() {
        return "register";
    }

    @RequestMapping("showUpdatePwd")
    public String showUpdatePwd() {
        return "updatePwd";
    }

    @RequestMapping("studentArea")
    public String showstudentArea() {
        return "studentArea";
    }

    @RequestMapping("studentToTeacher")
    public String showStudentToTeacher() {
        return "studentToTeacher";
    }

    @RequestMapping("showQuestionDetail")
    public String showQuestionDetail(HttpServletRequest request, int qId) {
        questionService.showAQuestion(request, qId);
        return "studentAreaDetail";
    }

    @RequestMapping("showStudentToTeacherDetail")
    public String showStudentToTeacherDetail(HttpServletRequest request, int qId) {
        questionService.showAQuestion(request, qId);
        return "studentToTeacherDetail";
    }

    @RequestMapping("showReplyStudentEdit")
    public String showReplyStudentEdit(HttpServletRequest request, int qId) {
        questionService.showAQuestion(request, qId);
        return "replyStudentEdit";
    }

    @RequestMapping("showTeachInfo")
    public String showTeachInfo() {
        return "teachInfo";
    }

    @RequestMapping("showTeachResource")
    public String showTeachResource() {
        return "teachResource";
    }

    @RequestMapping("showMyArea")
    public String showMyArea_Teacher(HttpServletRequest request) {
        CheckLoginStatus checkLoginStatus = new CheckLoginStatus(request);
        O_User loginUser = checkLoginStatus.getUsers();
        String returnStr = "myArea_Student";
        if (loginUser.getuType() == 1) {
            returnStr = "myArea_Teacher";
        }
        return returnStr;
    }

    @RequestMapping("showTeachInfoDetail")
    public String showTeachInfoDetail(HttpServletRequest request, int nId) {
        noticeService.showTeachInfoDetail(request, nId);
        return "teachInfoDetail";
    }

    @RequestMapping("showTeachResourceManager")
    public String showTeachResourceManager() {
        return "teachResourceManager";
    }

    @RequestMapping("showReplyManager")
    public String showReplyManager() {
        return "replyManager";
    }

    @RequestMapping("showReplyStudent")
    public String showReplyStudent() {
        return "replyStudent";
    }

}

package top.tsep.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import top.tsep.pojo.SubjectEntity;
import top.tsep.service.SubjectService;

import java.util.List;

@Controller
public class LoginController {
    @Autowired
    private SubjectService subjectService;

    @RequestMapping(value = "getSubject",method = RequestMethod.GET)
    @ResponseBody
    public List<SubjectEntity> getSubject(){
        List<SubjectEntity> subject = subjectService.findAllSubject();
        return subject;
    }
}

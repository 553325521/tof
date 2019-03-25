package top.tsep.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import top.tsep.service.QuestionService;
import top.tsep.service.SubjectService;
import top.tsep.service.UserService;
import top.tsep.utils.ResultMap;

import java.util.Map;

@Controller
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ResultMap save(@RequestParam Map<String,Object> map) {
        return questionService.save(map);
    }
}

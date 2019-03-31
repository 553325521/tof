package top.tsep.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import top.tsep.pojo.QuestionEntity;
import top.tsep.pojo.TagEntity;
import top.tsep.pojo.UserEntity;
import top.tsep.service.QuestionService;
import top.tsep.service.SubjectService;
import top.tsep.service.TagService;
import top.tsep.service.UserService;
import top.tsep.utils.CheckLoginStatus;
import top.tsep.utils.ResultMap;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @Autowired
    private TagService tagService;

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ResultMap save(@RequestParam Map<String,Object> map, HttpServletRequest request) {
        return questionService.save(map,request);
    }

    @RequestMapping(value = "/questionlist", method = RequestMethod.GET)
    @ResponseBody
    public List<QuestionEntity> questionlist(@RequestParam Map<String,Object> map, HttpServletRequest request) {
        CheckLoginStatus checkLoginStatus = new CheckLoginStatus(request);
        UserEntity u = checkLoginStatus.getUsers();
        map.put("subjectId",u.getAttribute2());
        List<QuestionEntity> list = questionService.selectBysubjectId(map);
        return list;
    }

    @RequestMapping(value = "/taglist", method = RequestMethod.GET)
    @ResponseBody
    public List<TagEntity> taglist(@RequestParam Map<String,Object> map, HttpServletRequest request) {
        CheckLoginStatus checkLoginStatus = new CheckLoginStatus(request);
        UserEntity u = checkLoginStatus.getUsers();
        map.put("subjectId",u.getAttribute2());
        List<TagEntity> list = tagService.list(map);
        return list;
    }
}

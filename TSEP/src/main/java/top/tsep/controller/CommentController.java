package top.tsep.controller;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import top.tsep.pojo.QuestionEntity;
import top.tsep.pojo.TagEntity;
import top.tsep.pojo.UserEntity;
import top.tsep.service.CommentService;
import top.tsep.service.QuestionService;
import top.tsep.service.TagService;
import top.tsep.utils.CheckLoginStatus;
import top.tsep.utils.ResultMap;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("comment")
public class CommentController {

    @Autowired
    private CommentService commentService;


    @RequestMapping(value = "/save", method = RequestMethod.GET)
    @ResponseBody
    public ResultMap save(@RequestParam Map<String,Object> map, HttpServletRequest request) {
        return commentService.save(map,request);
    }
}

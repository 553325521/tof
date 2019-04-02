package top.tsep.controller;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import top.tsep.pojo.CommentEntity;
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
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @Autowired
    private TagService tagService;

    @Autowired
    private CommentService commentService;

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

    @RequestMapping(value = "/question_detail", method = RequestMethod.GET)
    @ResponseBody
    public QuestionEntity question_detail(@RequestParam Map<String,Object> map, HttpServletRequest request) {
        CheckLoginStatus checkLoginStatus = new CheckLoginStatus(request);
        UserEntity u = checkLoginStatus.getUsers();
        String qId = map.get("qId").toString();
        QuestionEntity questionEntity = questionService.selectByPrimaryKey(Integer.parseInt(qId));
        String tagId = questionEntity.getTag();
        if (tagId != "" && tagId != null) {
            List<String> listTag = tagService.findTagNameByList(tagId);
            if (listTag != null && listTag.size() != 0){
                String tagName = StringUtils.join(listTag.toArray(), ",");
                questionEntity.setTagName(tagName);
            }
        }
        return questionEntity;
    }

    @RequestMapping(value = "/commetnList", method = RequestMethod.GET)
    @ResponseBody
    public List<CommentEntity> commetnList(@RequestParam Map<String,Object> map, HttpServletRequest request) {
        String qId = map.get("qId").toString();
        List<CommentEntity> list =  commentService.selectByQuestionId(Integer.parseInt(qId));
        return list;
    }
}

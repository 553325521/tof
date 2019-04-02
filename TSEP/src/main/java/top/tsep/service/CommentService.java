package top.tsep.service;

import org.springframework.web.bind.annotation.RequestParam;
import top.tsep.pojo.CommentEntity;
import top.tsep.pojo.QuestionEntity;
import top.tsep.utils.ResultMap;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface CommentService {

    /**
     * 发表评论
     */
    public ResultMap save(Map<String, Object> parameter, HttpServletRequest request);

    public List<CommentEntity> selectByQuestionId(Integer qId);
}

package top.tsep.service;

import top.tsep.pojo.QuestionEntity;
import top.tsep.utils.ResultMap;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface QuestionService {

    /**
     * 注册用户
     */
    public ResultMap save(Map<String,Object> parameter,HttpServletRequest request);

    List<QuestionEntity> selectBysubjectId(Integer subjectId);
}

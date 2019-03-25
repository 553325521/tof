package top.tsep.service;

import top.tsep.utils.ResultMap;

import java.util.Map;

public interface QuestionService {

    /**
     * 注册用户
     */
    public ResultMap save(Map<String,Object> parameter);
}

package top.tsep.dao;

import org.springframework.web.bind.annotation.RequestParam;
import top.tsep.pojo.QuestionEntity;

import java.util.List;
import java.util.Map;

public interface QuestionDao {
    int deleteByPrimaryKey(Integer id);

    int insert(QuestionEntity record);

    int insertSelective(QuestionEntity record);

    QuestionEntity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QuestionEntity record);

    int updateByPrimaryKey(QuestionEntity record);

    List<QuestionEntity> selectBysubjectId(@RequestParam Map<String,Object> map);
}
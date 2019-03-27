package top.tsep.dao;

import top.tsep.pojo.QuestionEntity;

import java.util.List;

public interface QuestionDao {
    int deleteByPrimaryKey(Integer id);

    int insert(QuestionEntity record);

    int insertSelective(QuestionEntity record);

    QuestionEntity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QuestionEntity record);

    int updateByPrimaryKey(QuestionEntity record);

    List<QuestionEntity> selectBysubjectId(Integer subjectId);
}
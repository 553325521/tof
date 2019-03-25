package top.tsep.dao;

import top.tsep.pojo.QuestionEntity;

public interface QuestionDao {
    int deleteByPrimaryKey(Integer id);

    int insert(QuestionEntity record);

    int insertSelective(QuestionEntity record);

    QuestionEntity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QuestionEntity record);

    int updateByPrimaryKey(QuestionEntity record);
}
package top.tsep.dao;

import top.tsep.pojo.CommentEntity;

import java.util.List;

public interface CommentDao {
    int deleteByPrimaryKey(Integer id);

    int insert(CommentEntity record);

    int insertSelective(CommentEntity record);

    CommentEntity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CommentEntity record);

    int updateByPrimaryKey(CommentEntity record);

    public List<CommentEntity> selectByQuestionId(Integer qId);
}
package top.tsep.dao;

import top.tsep.pojo.CommentEntity;

public interface CommentDao {
    int deleteByPrimaryKey(Integer id);

    int insert(CommentEntity record);

    int insertSelective(CommentEntity record);

    CommentEntity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CommentEntity record);

    int updateByPrimaryKey(CommentEntity record);
}
package top.tsep.dao;

import top.tsep.pojo.LogEntity;

public interface LogDao {
    int deleteByPrimaryKey(Integer id);

    int insert(LogEntity record);

    int insertSelective(LogEntity record);

    LogEntity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LogEntity record);

    int updateByPrimaryKey(LogEntity record);
}
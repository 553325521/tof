package top.tsep.dao;

import top.tsep.pojo.UserSubjectEntity;

public interface UserSubjectDao {
    int insert(UserSubjectEntity record);

    int insertSelective(UserSubjectEntity record);
}
package top.tsep.dao;

import top.tsep.pojo.SubjectEntity;

public interface SubjectDao {
    int deleteByPrimaryKey(Integer id);

    int insert(SubjectEntity record);

    int insertSelective(SubjectEntity record);

    SubjectEntity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SubjectEntity record);

    int updateByPrimaryKey(SubjectEntity record);

    SubjectEntity selectByName(String subject_name);
}
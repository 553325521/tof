package top.tsep.dao;

import org.apache.ibatis.annotations.Param;

import top.tsep.pojo.SubjectEntity;

import java.util.List;


public interface SubjectDao {
    int deleteByPrimaryKey(Integer id);

    int insert(SubjectEntity record);

    int insertSelective(SubjectEntity record);

    SubjectEntity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SubjectEntity record);

    int updateByPrimaryKey(SubjectEntity record);

    SubjectEntity selectByName(@Param("subjectName")String subjectName);

    List<SubjectEntity> findAllSubject();
}
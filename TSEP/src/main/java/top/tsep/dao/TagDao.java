package top.tsep.dao;

import java.util.List;
import java.util.Map;

import top.tsep.pojo.TagEntity;

public interface TagDao {
    int deleteByPrimaryKey(Integer id);

    int insert(TagEntity record);

    int insertSelective(TagEntity record);

    TagEntity selectByPrimaryKey(Integer id);
    
    List<TagEntity> selectListBySubjectId(Map<String,Object> map);
    
    int selectListCount(Map<String,Object> map);

    int updateByPrimaryKeySelective(TagEntity record);

    int updateByPrimaryKey(TagEntity record);
}
package com.os.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.os.pojo.O_Resource;
import com.os.utils.BootStrapTable;

public interface ResourceDao {
    int deleteByPrimaryKey(Integer resourceId);

    int insert(O_Resource record);

    int insertSelective(O_Resource record);

    O_Resource selectByPrimaryKey(Integer resourceId);

    int updateByPrimaryKeySelective(O_Resource record);

    int updateByPrimaryKey(O_Resource record);
    
    List<O_Resource> selectAll(BootStrapTable bst);
    
    int getTotal();
    
    int deletes(@Param("ids")List  ids);
}
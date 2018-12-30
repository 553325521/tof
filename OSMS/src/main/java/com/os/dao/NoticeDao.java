package com.os.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.os.pojo.O_Notice;
import com.os.utils.BootStrapTable;

public interface NoticeDao {
    int deleteByPrimaryKey(Integer nId);

    int insert(O_Notice record);

    int insertSelective(O_Notice record);

    O_Notice selectByPrimaryKey(Integer nId);
    
    List<O_Notice> selectAll(BootStrapTable bst);
    
    List<O_Notice> selectLast();
    
    int getTotal();
    
    int deleteNotices(@Param("ids")List  ids);

    int updateByPrimaryKeySelective(O_Notice record);

    int updateByPrimaryKey(O_Notice record);
}
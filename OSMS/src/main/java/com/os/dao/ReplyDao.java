package com.os.dao;

import java.util.List;

import com.os.pojo.O_Question;
import com.os.pojo.O_Reply;

public interface ReplyDao {
    int deleteByPrimaryKey(Integer rId);

    int insert(O_Reply record);

    int insertSelective(O_Reply record);

    O_Reply selectByPrimaryKey(Integer rId);
    
    int selectReplyCountByQId(Integer qId);
    
    List<O_Reply> getDataByQId(Integer rQId);
    
    List<O_Reply> getDataByUser(Integer uId);

    int updateByPrimaryKeySelective(O_Reply record);

    int updateByPrimaryKey(O_Reply record);
    
    int deleteByUser(O_Question o);
}
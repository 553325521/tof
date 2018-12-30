package com.os.dao;

import com.os.pojo.O_User;


public interface UserDao {
    int deleteByPrimaryKey(Integer uId);

    int insert(O_User record);

    int insertSelective(O_User record);

    O_User selectByPrimaryKey(Integer uId);

    O_User selectByUser(O_User user);

    int updateByPrimaryKeySelective(O_User record);

    int updateByPrimaryKey(O_User record);
}
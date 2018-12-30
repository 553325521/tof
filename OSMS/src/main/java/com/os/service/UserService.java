package com.os.service;

import javax.servlet.http.HttpServletRequest;

import com.os.pojo.O_User;
import com.os.utils.ResultMap;

public interface UserService {
    public ResultMap checkLogin(O_User user, HttpServletRequest request);

    public ResultMap register(O_User user, HttpServletRequest request);

}

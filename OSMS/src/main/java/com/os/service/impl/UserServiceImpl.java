package com.os.service.impl;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.os.dao.UserDao;
import com.os.pojo.O_User;
import com.os.service.UserService;
import com.os.utils.CheckLoginStatus;
import com.os.utils.ResultMap;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public ResultMap checkLogin(O_User user, HttpServletRequest request) {
        ResultMap resultMap = new ResultMap();
        CheckLoginStatus checkLoginStatus = new CheckLoginStatus(request);
        if (checkLoginStatus.isLogin()) {
            resultMap.setResultType("0");
            resultMap.setResultContent("用户已在线");
        } else {
            O_User resultUser = userDao.selectByUser(user);
            if (resultUser != null) {
                checkLoginStatus.putUsers(resultUser);
            } else {
                resultMap.setResultType("0");
                resultMap.setResultContent("用户名或密码不正确");
            }
        }
        return resultMap;
    }

    @Override
    public ResultMap register(O_User user, HttpServletRequest request) {
        // TODO Auto-generated method stub
        user.setuType(0);
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
        user.setuTx(basePath + "/img/study.jpg");
        int respectRows = userDao.insertSelective(user);
        ResultMap resultMap = new ResultMap();
        if (respectRows > 0) {
            resultMap.setResultType("1");
            resultMap.setResultContent("注册成功");
        } else {
            resultMap.setResultType("0");
            resultMap.setResultContent("注册失败,请与管理员联系");
        }
        return resultMap;
    }

}

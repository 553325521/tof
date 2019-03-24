package top.tsep.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import top.tsep.utils.ResultMap;

public interface UserService {

    /**
     * 注册用户验证
     */
	public ResultMap register(Map<String,Object> parameter);
}

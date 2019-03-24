package top.tsep.service.impl;

import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import top.tsep.pojo.UserEntity;
import top.tsep.service.UserService;
import top.tsep.utils.ResultMap;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Override
	public ResultMap register(Map<String, Object> parameter) {
		ResultMap r = new ResultMap();
		UserEntity u = new UserEntity();
		
		return r;
	}

}

package com.pgy.account.web.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.pgy.account.web.dao.UserDao;
import com.pgy.account.web.model.entity.User;
import com.pgy.account.web.service.UserService;

/**
 * 用户业务处理接口实现
 * @author 墨凉
 *
 */
@Service
public class UserServiceImpl implements UserService{
	
	@Resource
	private UserDao userDao;

	@Override
	public User queryUserByUserNameAndPassword(User user) {
		
		return userDao.queryUserByUserNameAndPassword(user);
	}


	@Override
	public User queryUser(User user) {
		return userDao.queryUser(user);
	}

}

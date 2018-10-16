package com.pgy.account.web.service;

import com.pgy.account.web.model.entity.User;

/**
 * 用户业务处理接口
 * @author 墨凉
 *
 */
public interface UserService {
    
	/**
	 * 通过用户名密码查询用户
	 * @param user
	 * @return user
	 */
	User queryUserByUserNameAndPassword(User user);
    
    /**
     * 通过用户名查询
     * @param user
     * @return
     */
	User queryUser(User user);
    
}

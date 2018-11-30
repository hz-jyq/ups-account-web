package com.pgy.account.web.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.pgy.account.web.model.entity.User;
import com.pgy.ups.common.exception.ParamValidException;


public interface LoginService {

	boolean verifyLoginTimeOver(User user) throws ParamValidException ;

	User VerifyLogin(User user) throws ParamValidException ;

	void loginOut(HttpServletRequest request, HttpServletResponse response);

	boolean saveLogin(User user, HttpServletResponse response);
	
	public boolean checkLoginStatus(HttpServletRequest request);

}

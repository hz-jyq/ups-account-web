package com.pgy.account.web.aop;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;

import com.alibaba.druid.util.StringUtils;

import com.pgy.account.web.model.entity.User;
import com.pgy.account.web.service.LoginService;
import com.pgy.account.web.service.PremissionService;
import com.pgy.account.web.service.impl.LoginServiceImpl;
import com.pgy.ups.common.exception.BussinessException;
import com.pgy.ups.common.utils.CookieUtils;




/**
  *  权限拦截
 * @author 墨凉
 *
 */
@Component
@Aspect
public class PremissionAop implements Ordered{
	
	
	@Resource
	private HttpServletRequest request;
	
	@Resource
	private LoginService loginApi;
	
	@Resource
	private PremissionService premissionApi;
	
	
	
	@Pointcut("@annotation(com.pgy.account.web.utils.annotation.RequiredPermission)||@within(com.pgy.account.web.utils.annotation.RequiredPermission)")
	public void RequiredPermissionPointcut() {}
	
	@Before(value="RequiredPermissionPointcut()")
	public void  checkPremission(JoinPoint joinPoint) {
		boolean flag=loginApi.checkLoginStatus(request);
		//验证登录失败
		if(!flag) {
			throw new BussinessException("登录失败或超时，请重新登录！");
		}
		String userName=CookieUtils.getCookieValue(request, LoginServiceImpl.USER_NAME);
		if(StringUtils.isEmpty(userName)) {
			throw new BussinessException("cookie中未能获取user信息！");
		}
		String requstUrl=request.getRequestURI();
		User user=new User();
		user.setUserName(userName);
		List<String> blackNames=premissionApi.getUserBlackNames(user);		
		//若在黑名单内
		if(blackNames.contains(requstUrl)) {
			throw new BussinessException("该用户无权发起该请求！");
		}
		return ;
		
	}
	
	/**
	 * 拦截器顺序 应在日志拦截之后
	 */
	@Override
	public int getOrder() {
		// TODO Auto-generated method stub
		return 2;
	}

}

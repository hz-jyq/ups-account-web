package com.pgy.account.web.controller;

import java.util.Objects;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pgy.account.web.constant.VoCodeConstant;
import com.pgy.account.web.exception.BussinessException;
import com.pgy.account.web.exception.ParamValidException;
import com.pgy.account.web.model.entity.User;
import com.pgy.account.web.model.vo.Vo;
import com.pgy.account.web.service.LoginService;
import com.pgy.ups.account.commom.annotation.ParamsLog;



/**
 * 登录认真
 * @author 墨凉
 *
 */
@Controller
public class LoginController {
		
	@Resource
	private HttpServletRequest request;
	
	@Resource
	private HttpServletResponse response;
	
	@Resource
	private LoginService loginService;
	
	@RequestMapping(value= {"/","/login"})
	public String login() {		
		return "/login";
	}

	
	/**
	 * 
	 * 首页登录
	 * @author 墨凉
	 * @param  user
	 * @throws ParamValidException 
	 * 
	 */
	@ParamsLog
	@ResponseBody
	@PostMapping("/loginOn")	
	public Vo loginOn(@RequestBody User user) throws ParamValidException {		
		if(loginService.verifyLoginTimeOver(user)) {
			throw new BussinessException("该账户登录次数超过限制，请一分钟后再试！");
		}
		user=loginService.VerifyLogin(user);
		if(Objects.isNull(user)) {			
			throw new BussinessException("登录失败，账户密码不正确！");
		}		
		//生成token放入redis中保存30分钟,同时存入账户信息
		loginService.saveLogin(user,response);
		return new Vo(VoCodeConstant.SUCCESS);
	}
	
	/**
	 *   用户登出
	 * @return 登录页面
	 */
	@RequestMapping("/loginOut")	
	public String loginOut() {
		loginService.loginOut(request,response);
		return "redirect:/login";
	}

}

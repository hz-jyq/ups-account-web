package com.pgy.account.web.controller;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pgy.account.web.api.LoginApi;
import com.pgy.account.web.api.PremissionApi;
import com.pgy.account.web.constant.VoCodeConstant;
import com.pgy.account.web.exception.ParamValidException;
import com.pgy.account.web.model.entity.Menu;
import com.pgy.account.web.model.entity.User;
import com.pgy.account.web.model.vo.Vo;
import com.pgy.account.web.utils.CookieUtils;
import com.pgy.account.web.utils.FreemarkerUtils;
import com.pgy.account.web.utils.annotation.ParamsLog;
import com.pgy.account.web.utils.annotation.RequiredPermission;

/**
 * 首页登录
 * 
 * @author 墨凉
 *
 */
@Controller
@ParamsLog
@RequestMapping("/index")
@RequiredPermission
public class IndexController {

	@Resource
	private HttpServletRequest request;

	@Resource
	private HttpServletResponse response;

	@Resource
	private FreemarkerUtils freemarkerUtils;

	@Resource
	private LoginApi loginApi;

	@Resource
	private PremissionApi premissionApi;

	/**
	 * 
	 * 首页登录
	 * 
	 * @param
	 * 
	 */

	@RequestMapping
	public String index(ModelMap modelMap) {
		String userName = CookieUtils.getCookieValue(request, LoginApi.USER_NAME);
		User user = new User();
		user.setUserName(userName);
		// 加载一级菜单列表
		Set<Menu> menus = premissionApi.queryUserMenus(user, 1);
		modelMap.put("menus", menus);
		modelMap.put("userName", userName);
		return "/index";
	}

	/**
	 * 查询一级菜单下的选项卡
	 * 
	 * @param menu
	 * @return
	 * @throws ParamValidException
	 */

	@ResponseBody
	@GetMapping("/queryTab/{linkedCode}")
	public Vo queryTab(@PathVariable String linkedCode) throws ParamValidException {
		// 查询一级菜单下的二级菜单(选项卡)
		if (StringUtils.isEmpty(linkedCode)) {
			throw new ParamValidException("菜单连接编码不能为空！");
		}
		// 获取当前用户登录信息
		String userName = CookieUtils.getCookieValue(request, LoginApi.USER_NAME);
		User u = new User();
		u.setUserName(userName);
		// 查询该用户权限下的所有二级菜单（二级菜单为选项卡）
		Set<Menu> subMenus = premissionApi.queryUserMenus(u, 2);
		//保留父菜单与入参linkedCode相同的二级菜单
		subMenus=subMenus.stream().filter(tab -> {
			Menu parentMenu = tab.getParentMenu();
			return !Objects.isNull(parentMenu) && linkedCode.equals(parentMenu.getLinkCode());
		}).collect(Collectors.toSet());
		
		Map<String, Object> dataMap = new LinkedHashMap<>(4);
		dataMap.put("subMenus", subMenus);
		// 渲染页面并返回html文本
		String html = freemarkerUtils.getFreemarkerPageToString("/index/tabs.ftl", dataMap);
		return new Vo(VoCodeConstant.SUCCESS).putResult("html", html);
	}

	@ResponseBody
	@PostMapping("/T1")
	public Vo queryTab() {
		return new Vo(VoCodeConstant.SUCCESS);
	}

}

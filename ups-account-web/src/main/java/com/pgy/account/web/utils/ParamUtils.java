package com.pgy.account.web.utils;

import java.util.Enumeration;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.curator.shaded.com.google.common.collect.Maps;

public class ParamUtils {

	private static ParamUtils paramUtils = new ParamUtils();

	// 初始查询页数
	private static final Integer INIT_PAGE_NUM = 1;

	// 默认的每页查询数量
	private static final Integer DEFAULT_PAGE_SIZE = 10;

	/**
	 * 取出HttpServletRequest中的所有参数
	 * 
	 * @param request
	 * @return map
	 */
	private ParamUtils() {

	}

	/**
	 * 单例模式
	 * 
	 * @return
	 */
	public static ParamUtils getInstance() {
		return paramUtils;
	}

	public Map<String, Object> getParamterMap(HttpServletRequest request) {
		Map<String, Object> params = Maps.newLinkedHashMap();
		Enumeration<String> enums = request.getParameterNames();
		while (enums.hasMoreElements()) {
			String key = enums.nextElement();
			Object value = request.getParameter(key);
			params.put(key, value);
		}
		return params;
	}

	/**
	 * 取出HttpServletRequest中的所有参数并封装 分页参数
	 * 
	 * @param request
	 * @return
	 */
	public Map<String, Object> getPageParamterMap(HttpServletRequest request) {
		Map<String, Object> params = Maps.newLinkedHashMap();
		Enumeration<String> enums = request.getParameterNames();
		while (enums.hasMoreElements()) {
			String key = enums.nextElement();
			Object value = request.getParameter(key);
			params.put(key, value);
		}
		Set<String> set = params.keySet();
		if (!set.contains("pageNumber")) {
			params.put("pageNumber", INIT_PAGE_NUM);
		}
		if (!set.contains("pageSize")) {
			params.put("pageSize", DEFAULT_PAGE_SIZE);
		}
		return params;
	}

}

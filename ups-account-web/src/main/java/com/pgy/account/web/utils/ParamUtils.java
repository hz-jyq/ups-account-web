package com.pgy.account.web.utils;

import java.util.Collection;
import java.util.Enumeration;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.curator.shaded.com.google.common.collect.Maps;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ParamUtils {

	private Logger logger = LoggerFactory.getLogger(ParamUtils.class);

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

	/**
	 * 参数不能有null
	 * 
	 * @param param
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public boolean notNull(Object... params) {
		for (int i = 0; i < params.length; i++) {
			if (Objects.isNull(params[i])) {
				logger.error("第" + i + "个参数为null");
				return false;
			}
			if (params[i] instanceof String && (StringUtils.isEmpty(params[i].toString()))) {
				logger.error("第" + i + "个参数为空字符串");
				return false;
			}
			if (params[i] instanceof Collection && ((Collection) params[i]).isEmpty()) {
				logger.error("第" + i + "个参数为空集合");
				return false;
			}
			if (params[i] instanceof Map && ((Map) params[i]).isEmpty()) {
				logger.error("第" + i + "个参数为空map");
				return false;
			}
		}
		return true;
	}
}

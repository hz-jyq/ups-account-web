package com.pgy.account.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pgy.account.web.constant.VoCodeConstant;
import com.pgy.account.web.exception.BussinessException;
import com.pgy.account.web.exception.ParamValidException;
import com.pgy.account.web.model.vo.Vo;

/**
 * Controller捕获异常统一处理
 * 
 * @description TODO
 * @author chen.gs
 * @create date 2016年4月28日
 * @modified by
 * @modify date
 * @version v1.0
 */
@ControllerAdvice
public class GlobalExceptionHandler {

	private final static Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

	@ExceptionHandler(Exception.class)
	@ResponseBody
	public Vo handleException(HttpServletRequest request, Exception e) {
		if (e instanceof BussinessException) {
			Vo exceptionVo = new Vo(VoCodeConstant.BUSSINDESS_ERROR, e.getMessage()).putResult("requestUrl",
					request.getRequestURI());
			logger.error("发生业务异常！{}", exceptionVo);
			return exceptionVo;
		}

		if (e instanceof ParamValidException) {
			Vo exceptionVo = new Vo(VoCodeConstant.PARAMS_ERROR, e.getMessage()).putResult("requestUrl",
					request.getRequestURI());
			logger.error("参数验证异常！{}", exceptionVo);
			return exceptionVo;
		}

		Vo exceptionVo = new Vo(VoCodeConstant.SYSTEM_ERROR, "系统异常").putResult("requestUrl", request.getRequestURI());
		logger.error("系统异常！{}", ExceptionUtils.getStackTrace(e));
		return exceptionVo;
	}

}

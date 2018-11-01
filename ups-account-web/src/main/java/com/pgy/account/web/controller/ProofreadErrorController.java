package com.pgy.account.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.dubbo.config.annotation.Reference;
import com.pgy.account.web.constant.VoCodeConstant;
import com.pgy.account.web.model.vo.Vo;
import com.pgy.account.web.utils.FreemarkerUtils;
import com.pgy.account.web.utils.annotation.RequiredPermission;
import com.pgy.ups.account.commom.annotation.ParamsLog;
import com.pgy.ups.account.facade.dubbo.api.ProofreadErrorService;
import com.pgy.ups.account.facade.from.PageInfo;
import com.pgy.ups.account.facade.from.ProofreadErrorForm;
import com.pgy.ups.account.facade.model.proofread.ProofreadError;

/**
 * 对账异常明细登录
 * 
 * @author 墨凉
 *
 */
@Controller
@ParamsLog
@RequestMapping("/proofreadError")
@RequiredPermission
public class ProofreadErrorController {

	@Resource
	private HttpServletRequest request;

	@Resource
	private HttpServletResponse response;

	@Resource
	private FreemarkerUtils freemarkerUtils;

	@Reference(timeout = 10000)
	private ProofreadErrorService proofreadErrorService;

	/**
	 * 
	 * 对账汇总主页
	 * 
	 * @param
	 * 
	 */
	@ResponseBody
	@RequestMapping
	public Vo index(ModelMap modelMap) {
		return new Vo(VoCodeConstant.SUCCESS).putResult("html",
				freemarkerUtils.getFreemarkerPageToString("/proofread/proofreadError.ftl", null));
	}

	/**
	 * 查询异常明细列表
	 * 
	 * @param form
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/queryProofreadErrorList")
	public Vo queryProofreadSumList(ProofreadErrorForm form) {
		PageInfo<ProofreadError> pageInfo = proofreadErrorService.getPage(form);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("proofreadErrorList", pageInfo.getList());
		return new Vo(VoCodeConstant.SUCCESS)
				.putResult("html",
						freemarkerUtils.getFreemarkerPageToString("/proofread/proofreadErrorTable.ftl", param))
				.putResult("total", pageInfo.getTotal());
	}

}

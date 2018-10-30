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
import com.pgy.account.web.utils.annotation.ParamsLog;
import com.pgy.account.web.utils.annotation.RequiredPermission;
import com.pgy.ups.account.facade.dubbo.api.ProofreadSumService;
import com.pgy.ups.account.facade.from.PageInfo;
import com.pgy.ups.account.facade.from.ProofreadSumForm;
import com.pgy.ups.account.facade.model.proofread.ProofreadSum;

/**
 * 对账汇总登录
 * 
 * @author 墨凉
 *
 */
@Controller
@ParamsLog
@RequestMapping("/proofreadSum")
@RequiredPermission
public class ProofreadSumController {

	@Resource
	private HttpServletRequest request;

	@Resource
	private HttpServletResponse response;

	@Resource
	private FreemarkerUtils freemarkerUtils;

	@Reference(timeout = 10000)
	private ProofreadSumService proofreadSumService;

	/**
	 * 
	 * 对账汇总主页
	 * 
	 * @param
	 * 
	 */

	@RequestMapping
	@ResponseBody
	public Vo index(ModelMap modelMap) {
		return new Vo(VoCodeConstant.SUCCESS).putResult("html",
				freemarkerUtils.getFreemarkerPageToString("/proofread/proofreadSum.ftl", null));

	}

	/**
	 * 查询对账汇总列表
	 * 
	 * @param form
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/queryProofreadSumList")
	public Vo queryProofreadSumList(ProofreadSumForm form) {
		PageInfo<ProofreadSum> pageInfo = proofreadSumService.getPage(form);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("proofreadSumList", pageInfo.getList());
		return new Vo(VoCodeConstant.SUCCESS)
				.putResult("html", freemarkerUtils.getFreemarkerPageToString("/proofread/proofreadSumTable.ftl", param))
				.putResult("total", pageInfo.getTotal());

	}

}

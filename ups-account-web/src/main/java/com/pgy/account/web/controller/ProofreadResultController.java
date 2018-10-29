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
import com.pgy.account.web.utils.FreemarkerUtils;
import com.pgy.account.web.utils.annotation.ParamsLog;
import com.pgy.account.web.utils.annotation.RequiredPermission;
import com.pgy.ups.account.facade.dubbo.api.ProofreadResultService;
import com.pgy.ups.account.facade.dubbo.api.ProofreadSumService;
import com.pgy.ups.account.facade.from.PageInfo;
import com.pgy.ups.account.facade.from.ProofreadResultForm;
import com.pgy.ups.account.facade.model.proofread.ProofreadResult;


/**
 * 对账结果登录
 * 
 * @author 墨凉
 *
 */
@Controller
@ParamsLog
@RequestMapping("/proofreadResult")
@RequiredPermission
public class ProofreadResultController {

	@Resource
	private HttpServletRequest request;

	@Resource
	private HttpServletResponse response;

	@Resource
	private FreemarkerUtils freemarkerUtils;
	
	@Reference(timeout=10000)
	private ProofreadSumService proofreadSumService;
	
	@Reference(timeout=10000)
	private ProofreadResultService proofreadResultService;
	
	/**
	 * 
     * 对账结果主页
	 * 
	 * @param
	 * 
	 */

	@RequestMapping
	public String index(ModelMap modelMap) {		
		return "/proofread/proofreadResult";
	}
	
	/**
	 *  查询对账结果列表
	 * @param form
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/queryProofreadResultList")
	public PageInfo<ProofreadResult>  queryProofreadSumList(ProofreadResultForm form) {
		 PageInfo<ProofreadResult> pageInfo=proofreadResultService.getPage(form);
		 Map<String,Object> param=new HashMap<String,Object>();
		 param.put("proofreadResultList", pageInfo.getList());
		 pageInfo.setHtml(freemarkerUtils.getFreemarkerPageToString("/proofread/proofreadResultTable.ftl", param));
		 return pageInfo;
	}

}

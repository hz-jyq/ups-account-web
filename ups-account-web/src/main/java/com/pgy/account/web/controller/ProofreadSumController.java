package com.pgy.account.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pgy.account.web.model.vo.Vo;
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
@RequestMapping("/proofreadSum")
@RequiredPermission
public class ProofreadSumController {

	@Resource
	private HttpServletRequest request;

	@Resource
	private HttpServletResponse response;

	@Resource
	private FreemarkerUtils freemarkerUtils;
	

	
    
	
	
	/**
	 * 
          * 对账汇总主页
	 * 
	 * @param
	 * 
	 */

	@RequestMapping
	public String index(ModelMap modelMap) {		
		return "/proofread/proofreadSum";
	}
	
	/**
	 *  查询对账汇总列表
	 * @param form
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/queryProofreadSumList")
	public Vo queryProofreadSumList() {
		/* PageInfo<ProofreadSum> pageInfo=proofreadSumService.getPage(form);
		 Map<String,Object> param=new HashMap<String,Object>();
		 param.put("proofreadSumList", pageInfo.getList());
		 pageInfo.setHtml(freemarkerUtils.getFreemarkerPageToString("/proofread/proofreadSumTable.ftl", param));
		 return pageInfo;*/
		return null;
	}

}

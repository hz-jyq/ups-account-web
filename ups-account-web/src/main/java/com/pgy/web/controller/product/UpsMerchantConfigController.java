package com.pgy.web.controller.product;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.dubbo.config.annotation.Reference;
import com.pgy.ups.common.page.PageInfo;
import com.pgy.ups.pay.interfaces.entity.MerchantConfigEntity;
import com.pgy.ups.pay.interfaces.form.MerchantConfigForm;
import com.pgy.ups.pay.interfaces.service.config.dubbo.MerchantConfigService;
import com.pgy.web.constant.VoCodeConstant;
import com.pgy.web.model.vo.Vo;
import com.pgy.web.utils.FreemarkerUtils;
import com.pgy.web.utils.annotation.RequiredPermission;

/**
 * 对账异常明细登录
 * 
 * @author 墨凉
 *
 */
@Controller
@RequiredPermission
@RequestMapping("/productConfig")
public class UpsMerchantConfigController {

	@Resource
	private HttpServletRequest request;

	@Resource
	private HttpServletResponse response;

	@Resource
	private FreemarkerUtils freemarkerUtils;

	@Reference(timeout = 10000)
	private MerchantConfigService merchantConfigService;

	/**
	 * 
	 * 银行配置主页
	 * 
	 * @param
	 * 
	 */
	@ResponseBody
	@RequestMapping("/showMerchant")
	public Vo showBank() {
		return new Vo(VoCodeConstant.SUCCESS).putResult("html",
				freemarkerUtils.getFreemarkerPageToString("/product/merchantConfig.ftl", null));

	}

	/**
	 * 查询列表
	 * 
	 * @param form
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/queryMerchantConfigList")
	public Vo queryMerchantConfigList(MerchantConfigForm form) {
		PageInfo<MerchantConfigEntity> pageInfo = merchantConfigService.queryByForm(form);
		Map<String, Object> param = new HashMap<>();
		param.put("merchantConfigList", pageInfo.getList());
		return new Vo(VoCodeConstant.SUCCESS)
				.putResult("html", freemarkerUtils.getFreemarkerPageToString("/product/merchantConfigTable.ftl", param))
				.putResult("total", pageInfo.getTotal());
	}
	
	
	@ResponseBody
	@RequestMapping("/enableConfig")
	public Vo enableConfig(Long id) {
		merchantConfigService.enableMerchantConfig(id);
		return new Vo(VoCodeConstant.SUCCESS,"启用成功！");				
	}
	
	@ResponseBody
	@RequestMapping("/disableConfig")
	public Vo disableConfig(Long id) {
		merchantConfigService.disableMerchantConfig(id);
		return new Vo(VoCodeConstant.SUCCESS,"禁用成功！");				
	}


}

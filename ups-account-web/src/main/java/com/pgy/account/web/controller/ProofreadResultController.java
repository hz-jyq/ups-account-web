package com.pgy.account.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.dubbo.config.annotation.Reference;
import com.pgy.account.web.constant.VoCodeConstant;
import com.pgy.account.web.exception.ParamValidException;
import com.pgy.account.web.model.vo.Vo;
import com.pgy.account.web.utils.ExcelUtils;
import com.pgy.account.web.utils.FreemarkerUtils;
import com.pgy.account.web.utils.ParamUtils;
import com.pgy.account.web.utils.annotation.ParamsLog;
import com.pgy.account.web.utils.annotation.RequiredPermission;
import com.pgy.ups.account.facade.dubbo.api.ProofreadResultService;
import com.pgy.ups.account.facade.dubbo.api.ProofreadSuccessService;
import com.pgy.ups.account.facade.dubbo.api.ProofreadSumService;
import com.pgy.ups.account.facade.from.ExcelForm;
import com.pgy.ups.account.facade.from.PageInfo;
import com.pgy.ups.account.facade.from.ProofreadResultForm;
import com.pgy.ups.account.facade.model.proofread.ProofreadResult;
import com.pgy.ups.account.facade.model.proofread.ProofreadSuccess;

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

	@Reference(timeout = 10000)
	private ProofreadSumService proofreadSumService;

	@Reference(timeout = 10000)
	private ProofreadResultService proofreadResultService;

	@Reference(timeout = 10000)
	private ProofreadSuccessService proofreadSuccessService;

	/**
	 * 
	 * 对账结果主页
	 * 
	 * @param
	 * 
	 */
	@ResponseBody
	@RequestMapping
	public Vo index(ModelMap modelMap) {
		return new Vo(VoCodeConstant.SUCCESS).putResult("html",
				freemarkerUtils.getFreemarkerPageToString("/proofread/proofreadResult.ftl", null));
	}

	/**
	 * 查询对账结果列表
	 * 
	 * @param form
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/queryProofreadResultList")
	public Vo queryProofreadSumList(ProofreadResultForm form) {
		PageInfo<ProofreadResult> pageInfo = proofreadResultService.getPage(form);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("proofreadResultList", pageInfo.getList());
		return new Vo(VoCodeConstant.SUCCESS)
				.putResult("html",
						freemarkerUtils.getFreemarkerPageToString("/proofread/proofreadResultTable.ftl", param))
				.putResult("total", pageInfo.getTotal());
	}

	/**
	 * 对账成功明细下载
	 * 
	 * @param form
	 * @return
	 * @throws ParamValidException
	 */
	@RequestMapping("/successDownload/{channel}/{fromSystem}/{proofreadType}/{proofreadDate}/{fileName}")
	public void successDownLoad(@PathVariable("channel") String channel, @PathVariable("fromSystem") String fromSystem,
			@PathVariable("proofreadType") String proofreadType, @PathVariable("proofreadDate") String proofreadDate,
			@PathVariable("fileName") String fileName) throws ParamValidException {

		if (!ParamUtils.getInstance().notNull(channel, fromSystem, proofreadType, proofreadDate, fileName)) {
			throw new ParamValidException("参数不能为空！");
		}
		ExcelForm excelForm = new ExcelForm();
		excelForm.setChannel(channel);
		excelForm.setFromSystem(fromSystem);
		excelForm.setProofreadType(proofreadType);
		excelForm.setProofreadDate(proofreadDate);
		List<ProofreadSuccess> list = proofreadSuccessService.getExcelList(excelForm);
		String[] titles = { "对账日期", "商户号", "业务端", "商户订单号", "渠道订单创建时间", "渠道交易金额", "业务申请时间", "业务交易金额", "借款编号", "对账状态",
				"备注", "对账员" };
		String[] properties = { "proofreadDate", "businessNum", "fromSystem", "businessOrderNum",
				"channelOrderCreateTime", "channelExchangeMoney", "businessOrderCreateTime", "businessExchangeMoney",
				"borrowNum", "proofreadStatus", "remark", "updateUser" };
		ExcelUtils.outputExcel(fileName, titles, properties, list, response);
	}

}

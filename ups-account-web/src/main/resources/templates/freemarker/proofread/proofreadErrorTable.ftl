<#if proofreadErrorList??&&proofreadErrorList?size gt 0>
	<#list proofreadErrorList as proofreadError>		
		<tr>
			<td>
				${proofreadError.proofreadDate!''}
			</td>	
			<td>
				<#if proofreadError.fromSystem??>
					<#if proofreadError.fromSystem=='01'>
						美期
					<#elseif proofreadError.fromSystem=='02'>
						米融
					<#elseif proofreadError.fromSystem=='03'>
						秒呗
					</#if>
				</#if>
				-
				<#if proofreadError.proofreadType??>
					<#if proofreadError.proofreadType=='01'>
						借款
					<#elseif proofreadError.proofreadType=='02'>
						还款
					</#if>
				</#if>
			</td>
			<td>
				${proofreadError.businessOrderNum!''}
			</td>
			<td>
				${proofreadError.borrowNum!''}
			</td>
			<td>
				${proofreadError.businessExchangeMoney!''}
			</td>
			<td>
				${proofreadError.businessOrderStatuts!''}
			</td>
			<td>
				${proofreadError.businessOrderCreateTime!''}
			</td>
			<td>
				${proofreadError.channelExchangeMoney!''}
			</td>
			<td>
				${proofreadError.channelOrderStatus!''}
			</td>
			<td>
				${proofreadError.channelOrderCreateTime!''}
			</td>
			<td>
				<#if proofreadError.errorType??>
					<#if proofreadError.errorType=='01'>
						金额不一致
					<#elseif proofreadError.errorType=='02'>
						渠道有业务没有
					<#elseif proofreadError.errorType=='03'>
						业务有渠道没有
					</#if>
				</#if>
			</td>
			<td>
				<#if proofreadError.flowStatus??>
					<#if proofreadError.flowStatus=='01'>
						待处理
					<#elseif proofreadError.flowStatus=='02'>
						已预留
					<#elseif proofreadError.flowStatus=='03'>
						已归档
					<#elseif proofreadError.flowStatus=='04'>
						已失效
					</#if>
				</#if>
			</td>
			<td>
				${proofreadError.disposeTime!''}
			</td>
			<td>
				
			</td>
			<td>
				
			</td>
			<td>
				${proofreadError.updateUser!''}
			</td>
		</tr>
  </#list>
</#if>
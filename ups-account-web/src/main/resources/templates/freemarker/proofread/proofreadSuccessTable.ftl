<#if proofreadSuccessList??&&proofreadSuccessList?size gt 0>
	<#list proofreadSuccessList as proofreadSuccess>		
		<tr>
			<td>
				${proofreadSuccess.businessOrderNum!''}
			</td>
			<td>
				${proofreadSuccess.proofreadDate!''}
			</td>
			<td>
				<#if proofreadSuccess.channel??>
					<#if proofreadSuccess.channel=='01'>
						宝付
					<#elseif proofreadSuccess.proofreadType=='02'>
						其他
					</#if>
				</#if>
			</td>
			<td>
				${proofreadSuccess.businessNum!''}
			</td>	
			<td>
				<#if proofreadSuccess.fromSystem??>
					<#if proofreadSuccess.fromSystem=='01'>
						美期
					<#elseif proofreadSuccess.fromSystem=='02'>
						米融
					<#elseif proofreadSuccess.fromSystem=='03'>
						秒呗
					</#if>
				</#if>
				-
				<#if proofreadSuccess.proofreadType??>
					<#if proofreadSuccess.proofreadType=='01'>
						借款
					<#elseif proofreadSuccess.proofreadType=='02'>
						还款
					</#if>
				</#if>
			</td>
			<td>
				<#if proofreadSuccess.channel??>
					<#if proofreadSuccess.channel=='01'>
						宝付
					<#elseif proofreadSuccess.proofreadType=='02'>
						其他
					</#if>
				</#if>
			</td>
			<td>
				${proofreadSuccess.channelExchangeMoney!''}
			</td>
			<td>
				系统归档
			</td>
			<td>
				
			</td>
			<td>
				
			</td>
			
		</tr>
  </#list>
</#if>
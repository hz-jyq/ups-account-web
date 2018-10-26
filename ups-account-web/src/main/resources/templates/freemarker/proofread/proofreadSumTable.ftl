<#if proofreadSumList??&&proofreadSumList?size>0>
	<#list proofreadSumList as proofreadSum>
		<tr>
			<td>
				${proofreadSum.createTime!''}
			</td>
			<td>
				${proofreadSum.businessNum!''}
			</td>
			<td>
				<#if proofreadSum.fromSystem??>
					<#if proofreadSum.fromSystem=='01'>
						美期
					<#elseif proofreadSum.fromSystem=='02'>
						米融
					<#elseif proofreadSum.fromSystem=='03'>
						秒呗
					</#else>
				</#if>
				-
				<#if proofreadSum.proofreadType??>
					<#if proofreadSum.fromSystem=='01'>
						借款
					<#elseif proofreadSum.fromSystem=='02'>
						还款
					</#else>
				</#if>
			</td>
			<td>
				宝付
			</td>
			<td>
				${proofreadSum.proofreadDate!''}
			</td>
			<td>
				${proofreadSum.businessTotalMoney!''}/${proofreadSum.businessTotal!''}
			</td>
			<td>
				${proofreadSum.channelTotalMoney!''}/${proofreadSum.channelTotal!''}
			</td>
			<td>
				${proofreadSum.successTotalMoney!''}/${proofreadSum.successTotal!''}
			</td>
			<td>
				${proofreadSum.channelFailTotalMoney!''}/${proofreadSum.channelFailTotal!''}
			</td>
			<td>
				${proofreadSum.businessFailTotalMoney!''}/${proofreadSum.businessFailTotal!''}
			</td>
			<td>
				<#if proofreadSum.proofreadStatus??>
					<#if proofreadSum.proofreadStatus=='01'>
						已对账
					<#elseif proofreadSum.proofreadStatus=='02'>
						有异常
					<#elseif proofreadSum.proofreadStatus=='03'>
						待对账
					</#else>
				</#if>				
			</td>
			<td>
				
			</td>
			<td>
				${proofreadSum.updateTime!''}
			</td>
			<td>
				${proofreadSum.updateUser!''}
			</td>
		</tr>
	</#list>
</#if>

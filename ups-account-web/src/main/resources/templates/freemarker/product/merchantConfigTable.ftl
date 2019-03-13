<#if merchantConfigList??&&merchantConfigList?size gt 0>
	<#list merchantConfigList as merchantConfig>		
		<tr>
			<td>
				${merchantConfig_index+1}
			</td>
			<td>
				${merchantConfig.merchantCode!''}
			</td>	
			<td>
				${merchantConfig.merchantName!''}
			</td>
			<td>
				${merchantConfig.description!''}
			</td>
			<td>
				${merchantConfig.merchantPublicKey!''}
			</td>
			<td>
				${merchantConfig.upsPrivateKey!''}
			</td>
			<td> 
				 <a href="javascript:void(0)" class="btn btn-warning" onclick="removeMerchant('${merchantConfig.id!''}')">删除</a>
				 <a href="javascript:void(0)" class="btn btn-default" onclick="openConfig('${merchantConfig.id!''}')">配置</a>
				 <#if merchantConfig.available==true>
				     <a href="javascript:void(0)" class="btn btn-danger" onclick="disableConfig('${merchantConfig.id!''}')">禁用</a>
				 <#else>
				 	 <a href="javascript:void(0)" class="btn btn-success" onclick="enableConfig('${merchantConfig.id!''}')">启用</a>
				 </#if>
			</td>
		</tr>
  </#list>
</#if>
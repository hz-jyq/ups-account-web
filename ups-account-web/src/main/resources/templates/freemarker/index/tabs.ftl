<!--选项卡列表-->
<ul class="nav nav-tabs">
	<#if subMenus?? && subMenus?size gt 0>
		<#list subMenus as tab>
			<li <#if (tab_index)==0>class="active"</#if> >
	            <a href="#${tab.linkCode!''}" data-toggle="tab" onclick="requestUrl('${tab.linkUrl!''}','${tab.linkCode!''}')">
		        ${tab.menuName!''}
	            </a>
	        </li>
	    </#list>
	<#else>
		<h2>暂无内容</h2>
	</#if>
</ul>

<!--选项卡内容列表-->
<div class="tab-content">
	<#if subMenus?? && subMenus?size gt 0>
		<#list subMenus as tab>
			<div <#if (tab_index)==0>class="tab-pane fade in active"<#else>class="tab-pane fade"</#if>  id="${tab.linkCode!''}">
		      ${tab.linkCode!''}
	        </div>
	    </#list>	
	</#if>
</div>
<#if menus??&&menus?size gt 0>
	<#list menus as menu>
		<a href="javascript:void(0)" class="list-group-item" id="${menu.linkCode!''}" onclick="openTab('${menu.linkCode}')" >${menu.menuName!''}</a>
	</#list>
</#if>

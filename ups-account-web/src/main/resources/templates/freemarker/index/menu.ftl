<#if menus??&&menus?size gt 0>
	<#list menus?sort_by("menuOrder") as menu>
		<a href="javascript:void(0)" class="list-group-item" id="${menu.linkCode!''}" onclick="openTab('${menu.linkCode}')" >${menu.menuName!''}</a>
	</#list>
</#if>

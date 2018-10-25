$.extend({
	'queryPage': function(elements, page) {
		var pageNum = page;
		var data = elements.data;
		var paginationId = elements.paginationId;
		var dataAreaId = elements.dataAreaId;
		var pageSize = elements.pageSize;
		var action = elements.action;
		var async = elements.async;
		var functionName = elements.callbackMethod;

		if(async != true && async != false) {
			async = false;
		}

		$.ajax({
			type: "post",
			url: action + "?page=" + pageNum + "&pageSize" + pageSize,
			async: async,
			data: data,
			dataType: "json",
			success: function(result) {
				var $body = $("#" + dataAreaId);
				if(paginationId != undefined && paginationId != null && paginationId != "") {
					var $pagination = $("#" + paginationId);
					$pagination.empty();
				}
				if(result == null || result.html == undefined || result.html == null) {
					$alert('查询分页异常！没有查询到内容！');
					return;
				}
				$tbody.empty().append(result.html);
				if(result.total == undefined || result.total == 0 || paginationId == undefined) {
					$alert('查询分页异常！没有查询到内容！');
					return;
				}
				if(page == undefined || page == null || page == "") {
					page = 1;
				}
				if(page < 1) {
					page == 1;
				}
				var maxPage = result.total / pageSize + 1;
				if(page > maxPage) {
					page = maxPage;
				}
				var param = JSON.stringify(elements);
				$pagination.append("<li><a href='javascript:void(0)' onclick='$.queryPage(" + param + ",1)'>首页</a><li>");
				if(page == 1) {
					$pagination.append("<li class='disabled'><a href='javascript:void(0)'>«</a><li>");
				} else {
					$pagination.append("<li><a href='javascript:void(0)' onclick='$.queryPage(" + param + "," + (page - 1) + ")>«</a><li>");
				}
				if(page <= 5) {
					for(var i = 1; i <= maxPage; i++) {
						if(i == page) {
							$pagination.append("<li class='active'><a href='javascript:void(0)'>" + i + "</a><li>");
						} else {
							$pagination.append("<li><a href='javascript:void(0)' onclick='$.queryPage(" + param + "," + i + ")>" + i + "</a><li>");
						}
					}
					if(maxPage > 5) {
						$pagination.append("<li><a href='javascript:void(0)' onclick='$.queryPage(" + param + "," + (page + 3) + ")>...</a><li>");
					}
				} else if(page > maxPage - 5) {
					if(page > 5) {
						$pagination.append("<li><a href='javascript:void(0)' onclick='$.queryPage(" + param + "," + (page - 3) + ")>...</a><li>");
					}
					for(var i = maxPage - 4; i <= maxPage; i++) {
						if(i == page) {
							$pagination.append("<li class='active'><a href='javascript:void(0)'>" + i + "</a><li>");
						} else {
							$pagination.append("<li><a href='javascript:void(0)' onclick='$.queryPage(" + param + "," + i + ")>" + i + "</a><li>");
						}
					}
				} else {
					$pagination.append("<li><a href='javascript:void(0)' onclick='$.queryPage(" + param + "," + (page - 3) + ")>...</a><li>");
					$pagination.append("<li><a href='javascript:void(0)' onclick='$.queryPage(" + param + "," + (page - 2) + ")>" + (page - 2) + "</a><li>");
					$pagination.append("<li><a href='javascript:void(0)' onclick='$.queryPage(" + param + "," + (page - 1) + ")>" + (page - 1) + "</a><li>");
					$pagination.append("<li class='active'><a href='javascript:void(0)' >" + page + "</a><li>");
					$pagination.append("<li><a href='javascript:void(0)' onclick='$.queryPage(" + param + "," + (page + 1) + ")>" + (page + 1) + "</a><li>");
					$pagination.append("<li><a href='javascript:void(0)' onclick='$.queryPage(" + param + "," + (page + 2) + ")>" + (page + 2) + "</a><li>");
					$pagination.append("<li><a href='javascript:void(0)' onclick='$.queryPage(" + param + "," + (page + 3) + ")>...</a><li>");
				}

				if(functionName != undefined && functionName != null && functionName != '') {
					var fun = eval(functionName);
					fun();
				}
			},
			error: function() {
				$alert('网络异常！请刷新后重试！')
			}
		});
	}
});
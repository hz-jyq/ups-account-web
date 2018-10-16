//字符串不为空
$.extend({
	isNotEmpty: function(str) {
		return str != undefined && str != null && str != "";
	}
});

function $alert(message,f) {
	bootbox.alert({
		buttons: {
			ok: {
				label: '确定',
				className: 'btn-myStyle'
			}
		},
		title: "提示！",
		message: message,
		callback: f		
	});
}




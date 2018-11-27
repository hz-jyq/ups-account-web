//字符串不为空
$.extend({
	isNotEmpty: function(str) {
		return str != undefined && str != null && str != "";
	}
});
//弹窗
function $alert(message, f) {
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

function $popDownloadWin() {
	var $dialog = bootbox.dialog({
		message: '<p class="text-center">正在下载，请稍后...</p>',
		closeButton: true
	});
	return $dialog;
}

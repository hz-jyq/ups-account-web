//字符串不为空
$.extend({
	isNotEmpty: function(str) {
		return str != undefined && str != null && str != "";
	}
});
//弹窗
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
//自动选择下拉框
function sSelect(name,value,e){
    var thisName=$(e).text();
	$(e).parent().parent().parent().next().val(name);
	$(e).parent().parent().parent().next().next().val(value);
};



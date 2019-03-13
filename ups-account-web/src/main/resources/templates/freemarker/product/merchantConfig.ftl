<div class="panel panel-default">
	<div class="panel-heading"> 条件选项 </div>
	<div class="panel-body">
		<form id="queryMerchantForm" class="form-inline">
			<div class="row">
				<div class="form-group col-md-3">
					<label>产品名称:</label>
					<input type="text" class="form-control" name="merchantName">
				</div>
				<div class="form-group col-md-3">
					<label>产品编码:</label>
					<input type="text" class="form-control" name="merchantCode">
				</div>
				<div class="form-group col-md-3">
					<label>产品描述:</label>
					<input type="text" class="form-control" name="description">
				</div>
				<div class="form-group col-md-3">
					<button type="button" class="btn btn-primary " onclick="queryMerchantConfig('1')">查询</button>
				</div>

			</div>
		</form>
	</div>
</div>
<br>

<div class="table-responsive" style="width:1200px;overflow-x:auto;">
	<table class="table table-hover" style="width: 1800px;">
		<thead>
			<tr>
				<th>序号</th>
				<th>产品编码</th>
				<th>产品名称</th>
				<th>产品描述</th>
				<th>公钥文件名</th>
				<th>私钥文件名</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="merchantConfigBody" style="font-size: 13px;">

		</tbody>
	</table>
</div>

<div class="row">
	<div class="col-md-4">

	</div>
	<div class="col-md-8" style="text-align: right;">
		<ul class="pagination" id="merchantConfigPage">

		</ul>
	</div>
</div>

<!--添加弹框-->
<!--<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title">添加银行</h4>
			</div>
			<div class="modal-body">
				<form id="addbankConfigForm" class="form-inline">
					<div class="row">
						<div class="form-group col-md-8">
							<label>银行名称:</label>
							<input type="text" class="form-control" name="bankName" id="addbankName">
						</div>
					</div>
					<br />
					<div class="row">
						<div class="form-group col-md-8">
							<label>银行编码:</label>
							<input type="text" class="form-control" name="bankCode" id="addbankCode">
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="addbankConfig()">添加</button>
			</div>
		</div>
	</div>
</div>-->

<script type="text/javascript">
	//加载首次查询
	$(function() {
		queryMerchantConfig(1);
	});

	//分页查询table
	function queryMerchantConfig(page) {
		var elements = {
			pageNum: page,
			data: $("#queryMerchantForm").serialize(),
			paginationId: "merchantConfigPage",
			dataAreaId: "merchantConfigBody",
			pageSize: "10",
			action: "/ups-web/productConfig/queryMerchantConfigList"
		};
		$.queryPage(elements, page);
	}

	//启用配置
	function enableConfig(id) {

		$.ajax({
			url: "/ups-web/productConfig/enableConfig?id=" + id,
			type: "post",
			async: false,
			dataType: "json",
			cache: false,
			error: function() {
				$alert('网络异常，刷新后重试！')
			},
			success: function(vo) {
				if(vo.resultCode != '00') {
					$alert(vo.message);
					return;
				}
				$alert('启用成功！');
				refreshTable();
			}
		});

	}

	//禁用配置
	function disableConfig(id) {
		$.ajax({
			url: "/ups-web/productConfig/disableConfig?id=" + id,
			type: "post",
			async: false,
			dataType: "json",
			cache: false,
			error: function() {
				$alert('网络异常，刷新后重试！')
			},
			success: function(vo) {
				if(vo.resultCode != '00') {
					$alert(vo.message);
					return;
				}
				$alert('禁用成功！');
				refreshTable();
			}
		});
	}

	//删除银行
	function removeMerchant(id) {

		$confirm("确定删除商户吗?", function(flag) {
			if(flag) {
				$.ajax({
					url: "/ups-web/productConfig/removeMerchantConfig?id=" + id,
					type: "post",
					async: false,
					dataType: "json",
					cache: false,
					error: function() {
						$alert('网络异常，刷新后重试！')
					},
					success: function(vo) {
						if(vo.resultCode != '00') {
							$alert(vo.message);
							return;
						}
						$alert('删除成功！');
						refreshTable();
					}
				});
			}
		})
	}

	//添加银行
	/*function openAddBank() {
		$('#addbankName').val("");
		$('#addbankCode').val("");
		$('#addModal').modal('show');
	}*/

	/*function addbankConfig() {
		$.ajax({
			url: "/ups-web/productConfig/addBank",
			type: "post",
			async: false,
			data: $("#addbankConfigForm").serialize(),
			dataType: "json",
			cache: false,
			error: function() {
				$alert('网络异常，刷新后重试！')
			},
			success: function(vo) {
				if(vo.resultCode != '00') {
					$alert(vo.message);
					return;
				}
				$alert('添加成功！');
				refreshTable();
				$('#addModal').modal('hide');
			}
		});
	}*/

	function refreshTable() {
		var currPage = $('.pagination .active').find('a').text();
		queryMerchantConfig(currPage);
	}
</script>
<div class="panel panel-default">
	<div class="panel-heading"> 条件选项 </div>
	<div class="panel-body">
		<form id="queryProofreadErrorForm">
			<div class="row">
				<div class="form-group col-md-3">
					<label>对账渠道</label>
					<select class="form-control" name="channel">
						<option value="">全部</option>
						<option value="01">宝付</option>
					</select>
				</div>
				<div class="form-group col-md-3">
					<label>系统</label>
					<select class="form-control" name="fromSystem">
						<option value="">全部</option>
						<option value="01">美期</option>
					</select>
				</div>
				<div class="form-group col-md-3">
					<label>业务类型</label>
					<select class="form-control" name="proofreadType">
						<option value="">全部</option>
						<option value="01">借款</option>
						<option value="02">还款</option>
					</select>
				</div>
				<div class="form-group col-md-3">
					<label>异常状态</label>
					<select class="form-control" name="errorType">
						<option value="">全部</option>
						<option value="01">金额不一致</option>
						<option value="02">渠道有业务没有</option>
						<option value="03">业务有渠道没有</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-3">
					<label>流水状态</label>
					<select class="form-control" name="flowStatus">
						<option value="">全部</option>
						<option value="01">待处理</option>
						<option value="02">已预留</option>
						<option value="03">已归档</option>
						<option value="04">已失效</option>
					</select>
				</div>
				<div class="form-group col-md-3">
					<label>商户订单号</label>
					<input type="text" class="form-control" name="businessOrderNum">
				</div>
				<div class="form-group col-md-3">
					<label>选择对账日期</label>
					<input type="text" class="form-control date" name="proofreadDateStart">
				</div>
				<div class="form-group col-md-3">
					<label>至：</label>
					<input type="text" class="form-control date" name="proofreadDateEnd">
				</div>				
			</div>
			<div class="row">
				<div class="col-md-12" style="text-align: right;">
					<button type="button" class="btn btn-success" onclick="queryProofreadError('1')">查询记录</button>
				</div>
			</div>
		</form>
	</div>
</div>
<div class="table-responsive" style="width:1200px;overflow-x:auto;">
	<table class="table table-hover" style="width: 1800px;">
		<thead>
			<tr>
				<th>对账日期</th>
				<th style="width: 100px">业务类型</th>
				<th>商户订单号</th>
				<th>借款编号</th>
				<th>业务交易金额</th>
				<th>业务状态</th>
				<th>业务申请时间</th>
				<th>渠道交易金额</th>
				<th>渠道订单状态</th>
				<th>渠道交易时间</th>
				<th>异常类型</th>
				<th>流水状态</th>
				<th>处理时间</th>
				<th>操作</th>
				<th>备注</th>
				<th>操作员</th>
			</tr>
		</thead>
		<tbody id="proofreadErrorBody" style="font-size: 13px;">

		</tbody>
	</table>
</div>

<div class="row">
	<div class="col-md-4">

	</div>
	<div class="col-md-8" style="text-align: right;">
		<ul class="pagination" id="proofreadErrorPage">

		</ul>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		queryProofreadError(1);
	});
	//初始化日期控件 对账日期
	$(".date").datetimepicker({
		language: "zh-CN",
		format: 'yyyy-mm-dd', //显示格式
		todayHighlight: 1, //今天高亮
		minView: "month", //设置只显示到月份		
		autoclose: true,
		todayBtn: true
	});

	//初始化日期控件 创建日期
	$(".datetime").datetimepicker({
		language: "zh-CN",
		format: 'yyyy-mm-dd hh:ii:ss', //显示格式
		todayHighlight: 1, //今天高亮
		autoclose: true,
		todayBtn: true
	});

	function queryProofreadError(page) {
		var elements = {
			pageNum: page,
			data: $("#queryProofreadErrorForm").serialize(),
			paginationId: "proofreadErrorPage",
			dataAreaId: "proofreadErrorBody",
			pageSize: "10",
			action: "/ups-account-web/proofreadError/queryProofreadErrorList"
		};
		$.queryPage(elements, page);
	}
</script>
<div class="panel panel-default">
	<div class="panel-heading"> 条件选项 </div>
	<div class="panel-body">
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
				<label>选择对账日期</label>
				<input type="text" class="form-control date" name="proofreadDate">
			</div>
		</div>
		<div class="row">
			<div class="col-md-12" style="text-align: right;">
				<button type="button" class="btn btn-success" onclick="">手动导入对账文件</button>
			</div>
		</div>
		<form id="queryProofreadSumForm">
			<div class="row">
				<div class="form-group col-md-3">
					<label>对账状态</label>
					<select class="form-control" name="flowStatus">
						<option value="">全部</option>
						<option value="01">已对账</option>
						<option value="02">有异常</option>
						<option value="03">待对账</option>
					</select>
				</div>
				<div class="form-group col-md-3">
					<label>对账渠道</label>
					<select class="form-control" name="channel">
						<option value="">全部</option>
						<option value="01">宝付</option>
					</select>
				</div>
				<div class="form-group col-md-3">
					<label>选择对账日期</label>
					<input type="text" class="form-control date" name="proofreadDate">
				</div>
				<div class="form-group col-md-3">
					<label>操作员</label>
					<input type="text" class="form-control" name="updateUser">
				</div>
			</div>			
			<div class="row">
				<div class="form-group col-md-3">
					<label>创建时间</label>
					<input type="text" class="form-control datetime" name="createTimeStart">
				</div>
				<div class="form-group col-md-3">
					<label>至</label>
					<input type="text" class="form-control datetime" name="createTimeEnd">
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
			</div>
			<div class="row">
				<div class="col-md-12" style="text-align: right;">
					<button type="button" class="btn btn-success" onclick="queryProofreadSum('1')">查询记录</button>
				</div>
			</div>
		</form>
	</div>
</div>

<div class="table-responsive" style="width:1142px;overflow-x:auto;">
	<table class="table table-striped  table-hover" style="width: 1800px;">
		<thead>
			<tr>
				<th>创建时间</th>
				<th>商户号/账户号</th>
				<th style="width: 100px;">业务类型</th>
				<th>对账渠道</th>
				<th>对账日期</th>
				<th>业务总金额/总笔数</th>
				<th>渠道总金额/总笔数</th>
				<th>对账成功总金额/总笔数</th>
				<th>宝付对账失败数据</th>
				<th>业务对账失败数据</th>
				<th>对账状态</th>
				<th>操作</th>
				<th>最后修改时间</th>
				<th>操作员</th>
			</tr>
		</thead>
		<tbody id="proofreadSumBody">

		</tbody>
	</table>
</div>
<div class="row">
	<div class="col-md-4">

	</div>
	<div class="col-md-8" style="text-align: right;">
		<ul class="pagination" id="proofreadSumPage">
		</ul>
	</div>
</div>
</div>
<script type="text/javascript">
	$(function() {
		queryProofreadSum(1);
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
		minView: "hour",
		autoclose: true,
		todayBtn: true
	});

	function queryProofreadSum(page) {
		var elements = {
			pageNum: page,
			data: $("#queryProofreadSumForm").serialize(),
			paginationId: "proofreadSumPage",
			dataAreaId: "proofreadSumBody",
			pageSize: "8",
			action: "/ups-account-web/proofreadSum/queryProofreadSumList"
		};
		$.queryPage(elements, page);
	}
</script>
<div>
	<br>
	<br>
	<br>
	<div class="row">
		<form id="queryProofreadErrorForm">
			<div class="col-md-3">
				<!--下拉框的固定写法，不可变动-->
				<div class="input-group">
					<div class="input-group-btn">
						<button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown">对账渠道 <span class="caret"></span></button>
						<ul class="dropdown-menu">
							<li>
								<a href="javascript:void(0)" onclick="sSelect('宝付','01',this)">宝付</a>
							</li>
						</ul>
					</div>
					<input type="text" class="form-control">
					<input type="hidden" value="" name="channel">
				</div>
				<!--下拉框结束-->
			</div>
			<div class="col-md-3">
				<div class="input-group">
					<div class="input-group-btn">
						<button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown">系统<span class="caret"></span></button>
						<ul class="dropdown-menu">
							<li>
								<a href="javascript:void(0)" onclick="sSelect('美期','01',this)">美期</a>
							</li>
						</ul>
					</div>
					<input type="text" class="form-control">
					<input type="hidden" value="" name="fromSystem">
				</div>
			</div>
			<div class="col-md-3">
				<div class="input-group">
					<div class="input-group-btn">
						<button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown">业务类型<span class="caret"></span></button>
						<ul class="dropdown-menu">
							<li>
								<a href="javascript:void(0)" onclick="sSelect('借款','01',this)">借款</a>
							</li>
							<li>
								<a href="javascript:void(0)" onclick="sSelect('还款','02',this)">还款</a>
							</li>
						</ul>
					</div>
					<input type="text" class="form-control">
					<input type="hidden" value="" name="proofreadType">
				</div>
			</div>
			<div class="col-md-3">
				<div class="input-group">
					<div class="input-group-btn">
						<button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown">异常状态<span class="caret"></span></button>
						<ul class="dropdown-menu">
							<li>
								<a href="javascript:void(0)" onclick="sSelect('金额不一致','01',this)">金额不一致</a>
							</li>
							<li>
								<a href="javascript:void(0)" onclick="sSelect('渠道有业务没有','02',this)">渠道有业务没有</a>
							</li>
							<li>
								<a href="javascript:void(0)" onclick="sSelect('业务有渠道没有','03',this)">业务有渠道没有</a>
							</li>
						</ul>
					</div>
					<input type="text" class="form-control">
					<input type="hidden" value="" name="errorType">
				</div>
			</div>
	</div>
	<br>

	<div class="row">
		<div class="col-md-3">
			<!--下拉框的固定写法，不可变动-->
			<div class="input-group">
				<div class="input-group-btn">
					<button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown">流水状态 <span class="caret"></span></button>
					<ul class="dropdown-menu">
						<li>
							<a href="javascript:void(0)" onclick="sSelect('待处理','01',this)">待处理</a>
						</li>
						<li>
							<a href="javascript:void(0)" onclick="sSelect('已预留','02',this)">已预留</a>
						</li>
						<li>
							<a href="javascript:void(0)" onclick="sSelect('已归档','03',this)">已归档</a>
						</li>
						<li>
							<a href="javascript:void(0)" onclick="sSelect('已失效','04',this)">已失效</a>
						</li>
					</ul>
				</div>
				<input type="text" class="form-control">
				<input type="hidden" value="" name="flowStatus">
			</div>
			<!--下拉框结束-->
		</div>
		<div class="col-md-3">
			<div class="input-group">
				<span class="input-group-addon">商户订单号</span>
				<input type="text" class="form-control" name="businessOrderNum">
			</div>
		</div>
		<div class="col-md-3">
			<div class="input-group">
				<span class="input-group-addon">选择对账日期：</span>
				<input type="text" class="form-control date" name="proofreadDateStart">
			</div>
		</div>
		<div class="col-md-3">
			<div class="input-group">
				<span class="input-group-addon">至：</span>
				<input type="text" class="form-control date" name="proofreadDateEnd">
			</div>
		</div>
	</div>
	<br />
	<div class="row">
		<div class="col-md-12" style="text-align: right;">
			<button type="button" class="btn btn-success" onclick="queryProofreadError('1')">查询记录</button>
		</div>
	</div>
	</form>
	<br>
	<h3>对账异常明细表</h3>
	<br>
	<div style="width:1000px;overflow-x:auto;">
	<table class="table table-bordered table-striped table-hover" style="width: 1400px;">
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
		<tbody id="proofreadErrorBody">

		</tbody>
	</table>
	<div class="row">
		<div class="col-md-4">

		</div>
		<div class="col-md-4">

		</div>
		<div class="col-md-4">
			<ul class="pagination" id="proofreadErrorPage">
				<!--<li>
					<a href="javascript:void(0)">«</a>
				</li>
				<li class="active">
					<a href="javascript:void(0)">1</a>
				</li>
				<li class="disabled">
					<a href="javascript:void(0)">2</a>
				</li>
				<li>
					<a href="javascript:void(0)">3</a>
				</li>-->
			</ul>
		</div>
	</div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
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
			paginationId: "paginationId",
			dataAreaId: "proofreadErrorBody",
			pageSize: "8",
			action: "/ups-account-web/proofreadError/queryProofreadErrorList"
		};
		$.queryPage(elements, page);
	}
	
	
</script>
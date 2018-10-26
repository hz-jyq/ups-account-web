<div>
	<br>
	<br>
	<br>
	<div class="row">
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
				<span class="input-group-addon">选择对账日期</span>
				<input type="text" class="form-control date" name="proofreadDate">
			</div>
		</div>

	</div>
	<br>
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-3">
		</div>
		<div class="col-md-3">
		</div>
		<div class="col-md-3" style="text-align: right;">
			<button type="button" class="btn btn-success text-right">手动导入对账文件</button>
		</div>
	</div>
	<hr />
	<!--查询选项-->
	<form id="queryProofreadSumForm">
		<div class="row">
			<div class="col-md-3">
				<!--下拉框的固定写法，不可变动-->
				<div class="input-group">
					<div class="input-group-btn">
						<button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown">对账状态 <span class="caret"></span></button>
						<ul class="dropdown-menu">
							<li>
								<a href="javascript:void(0)" onclick="sSelect('已对账','01',this)">已对账</a>
							</li>
							<li>
								<a href="javascript:void(0)" onclick="sSelect('有异常','02',this)">有异常</a>
							</li>
							<li>
								<a href="javascript:void(0)" onclick="sSelect('待对账','03',this)">待对账</a>
							</li>
						</ul>
					</div>
					<input type="text" class="form-control">
					<input type="hidden" value="" name="proofreadStatus">
				</div>
				<!--下拉框结束-->
			</div>
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
					<span class="input-group-addon">选择对账日期</span>
					<input type="text" class="form-control date" name="proofreadDate">
				</div>
			</div>
			<div class="col-md-3">
				<div class="input-group">
					<span class="input-group-addon">操作员</span>
					<input type="text" class="form-control" name="updateUser">
				</div>
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-md-3">
				<div class="input-group">
					<span class="input-group-addon">创建时间：</span>
					<input type="text" class="form-control datetime" name="createTimeStart">
				</div>
			</div>
			<div class="col-md-3">
				<div class="input-group">
					<span class="input-group-addon">至：</span>
					<input type="text" class="form-control datetime" name="createTimeEnd">
				</div>
			</div>
			<div class="col-md-3">
			</div>
			<div class="col-md-3" style="text-align: right;">
				<button type="button" class="btn btn-success" onclick="queryProofreadSum('1')">查询记录</button>
			</div>
		</div>
	</form>
	<br>
	<h3>系统对账汇总表</h3>
	<br>
	<div style="width:1000px;overflow-x:auto;">
	<table class="table table-bordered table-striped table-hover" style="width: 1300px;">
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
	<div class="row">
		<div class="col-md-4">

		</div>
		<div class="col-md-4">

		</div>
		<div class="col-md-4">
			<ul class="pagination" id="proofreadSumPage">
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
		queryProofreadSum(1);
	});
	//初始化日期控件 对账日期
	$(".date").datetimepicker({
		language:"zh-CN",
		format: 'yyyy-mm-dd', //显示格式
		todayHighlight: 1, //今天高亮
		minView: "month", //设置只显示到月份		
		autoclose: true,
        todayBtn: true
	});
	
	//初始化日期控件 创建日期
	$(".datetime").datetimepicker({
		language:"zh-CN",
		format: 'yyyy-mm-dd hh:ii:ss', //显示格式
		todayHighlight: 1, //今天高亮
		autoclose: true,
        todayBtn: true
	});
	
	function queryProofreadSum(page){
		var elements={
			pageNum:page,
			data:$("#queryProofreadSumForm").serialize(),
			paginationId:"proofreadSumPage",
			dataAreaId:"proofreadSumBody",
			pageSize:"8",
			action:"/ups-account-web/proofreadSum/queryProofreadSumList"
		};
		$.queryPage(elements,page);
	}	
</script>
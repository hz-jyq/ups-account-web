<div>
	<br>
	<br>
	<br>
	<div class="row">
		<form id="queryProofreadResultForm">
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
					<span class="input-group-addon">选择对账日期：</span>
					<input type="text" class="form-control date" name="proofreadDate">
				</div>
			</div>
	</div>
	</form>
	<br />
	<div class="row">
		<div class="col-md-12" style="text-align: right;">
			<button type="button" class="btn btn-success" onclick="queryProofreadResult('1')">搜索</button>
		</div>
	</div>
	<br>
	<h3>对账文件下载</h3>
	<br>
	<div style="width:1000px;overflow-x:auto;">
		<table class="table table-bordered table-striped table-hover" style="width: 1800px;">
			<thead>
				<tr>
					<th>创建时间</th>
					<th>商户号/账户号</th>
					<th>业务类型</th>
					<th>业务账单文件</th>
					<th>对账渠道</th>
					<th>渠道资金文件</th>
					<th>对账日期</th>
					<th>对账状态</th>
					<th>失败原因</th>
					<th>结果文件</th>
					<th>最后修改时间</th>
					<th>操作员</th>
				</tr>
			</thead>
			<tbody id="proofreadResultBody">

			</tbody>
		</table>
	</div>
	<div class="row">
		<div class="col-md-4">

		</div>
		<div class="col-md-8" style="text-align: right;">
			<ul class="pagination" id="proofreadResultPage">
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
<script type="text/javascript">
	$(function() {
		queryProofreadResult(1);
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

	function queryProofreadResult(page) {
		var elements = {
			pageNum: page,
			data: $("#queryProofreadResultForm").serialize(),
			paginationId: "proofreadResultPage",
			dataAreaId: "proofreadResultBody",
			pageSize: "8",
			action: "/ups-account-web/proofreadResult/queryProofreadResultList"
		};
		$.queryPage(elements, page);
	}
	
	//业务数据下载
	function businessDownload(channel,fromSystem,proofreadType,proofreadDate){
		
	}
	
	//渠道数据下载
	function channelDownload(channel,fromSystem,proofreadType,proofreadDate){
		
	}
	
	//对账成功数据下载
	function successDownLoad(channel,fromSystem,proofreadType,proofreadDate){		
		window.location.href="/ups-account-web/proofreadResult/successDownload/"+channel+"/"+fromSystem+"/"+proofreadType+"/"+proofreadDate;
	}
</script>
<!doctype html>

<html lang="en">

	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="static/plugin/bootstrap3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="static/plugin/bootstrap3.3.7/css/bootstrap-datetimepicker.min.css">
		<title>UPS账务管理系统同</title>
	</head>
	<script src="static/js/jquery-3.2.1.min.js"></script>
	<script src="static/plugin/bootstrap3.3.7/js/bootstrap.min.js"></script>
	<script src="static/plugin/bootstrap3.3.7/js/bootstrap-datetimepicker.min.js"></script>
	<script src="static/plugin/bootstrap3.3.7/js/bootbox.min.js"></script>
	<script type="text/javascript" src="static/js/public/public.js"></script>
	<script type="text/javascript" src="static/js/public/table-page.js"></script>
	<style type="text/css">
		body {
			padding: 20px;
		}
		
		.headLeft {
			float: left;
		}
		
		.headRight {
			padding-top: 40px;
			padding-left: 340px;
		}
		
		.search {
			margin-bottom: 10px;
		}
		
		.search .toolbar {}
	</style>
	<!--必须使用较新版本的BootStrap才有如下效果-->

	<body>
		<div class="container" style="width: 1200px;">
			<div class="row">
				<div class="col-md-12">
					<div class="page-header">
						<h1>UPS 账务管理系统 </span></h1>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div>
						<ol class="breadcrumb">
							<li><span class="glyphicon glyphicon-home"></span>&nbsp;
								<a href="javascript:void(0)" onclick="loginOut()">退出登录</a>
							</li>
							<li class="active">当前用户：${userName!''}</li>
						</ol>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-2" align="center" style="padding-top: 50px;">
					<div id="menus" class="list-group">
						<a href="#" class="list-group-item active">
							主菜单
						</a>
						<!--系统菜单列表 根据权限加载-->
						<#include "/index/menu.ftl" />
					</div>
				</div>
				<div class="col-md-10" align="center" style="padding-left: 20px;">
					<!--选项卡以及内容部分-->
					<div class="row" id="tabs"></div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-10">
					<div align="center" style="padding-top: 200px">
						<p align="center" style="margin-top: 20px;color:#878B91;">
							Copyright 蒲公英数据科技有限公司&copy;2017-2020
						</p>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		//登出
		function loginOut() {
			window.location.href = "/ups-account-web/loginOut";
		}

		//打开选项卡
		function openTab(linkCode) {
			$.ajax({
				url: "/ups-account-web/index/queryTab/" + linkCode,
				type: "post",
				async: false,
				dataType: "json",
				cache: false,
				error: function() {
					$alert('网络异常，刷新后重试！')
				},
				success: function(vo) {
					if(vo.resultCode!='00'){
						$alert(vo.message);
						return;
					}
					$("#tabs").empty().html(vo.result.html);
				}
			});
		}

		//点击选项卡，加载数据
		function requestUrl(linkUrl, linkCode) {
			$.ajax({
				url: linkUrl,
				type: "post",
				async: false,
				dataType: "json",
				error: function() {
					$alert('网络异常，刷新后重试！')
				},
				success: function(vo) {
					if(vo.resultCode!='00'){
						$alert(vo.message);
						return;
					}
					$("#"+linkCode).empty().html(vo.result.html);
				}
			});
		}
	</script>

</html>
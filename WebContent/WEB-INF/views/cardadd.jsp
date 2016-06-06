<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>Starter Template for Bootstrap</title>

<link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	padding-top: 50px;
}

.starter-template {
	padding: 40px 15px;
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/nav.jsp" %>
	<div class="container">

		<div class="starter-template">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">新建图书卡</h3>
				</div>
				<div class="panel-body">
					<form id="signupForm" method="post" class="form-horizontal"
						action="/cardadd" novalidate="novalidate">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="code">卡号</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="code" name="code"
									placeholder="请输入卡号">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label" for="name">姓名</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="请输入姓名">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label" for="tel">电话</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="tel" name="tel"
									placeholder="请输入电话">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-9 col-sm-offset-4">
								<button type="submit" class="btn btn-primary" name="signup"
									value="添加">添加</button>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>

	</div>
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="//cdn.bootcss.com/jquery-validate/1.15.0/jquery.validate.min.js"></script>
	<script>
		$(function(){
			$("#cardhome").addClass("active");
			$("#signupForm").validate({
				rule:{
					code:"required",
					name:"required",
					tel:"required"
				},
				message:{
					code:"",
					name:"",
					tel:""
				},
				errorElement:"span",
				highlight : function(element, errorClass,
						validClass) {
					$(element).parents(".col-sm-5").addClass(
							"has-error").removeClass(
							"has-success");
				},
				unhighlight : function(element, errorClass,
						validClass) {
					$(element).parents(".col-sm-5").addClass(
							"has-success").removeClass(
							"has-error");
				}
			});
		});
	</script>
</body>
</html>
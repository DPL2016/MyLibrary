<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<body style="background-color: #CFFFC9">
	<%@ include file="/WEB-INF/views/nav.jsp"%>
	<div class="container">
		<c:choose>
			<c:when test="${'100'==param.msg}">
				<div class="alert alert-success alert-dismissible fade in"
					role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<strong>借书成功！</strong>
				</div>
			</c:when>
			<c:when test="${'101'==param.msg}">
				<div class="alert alert-warning alert-dismissible fade in"
					role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<strong>借书失败！</strong>
				</div>
			</c:when>
			<c:when test="${'200'==param.msg}">
				<div class="alert alert-success alert-dismissible fade in"
					role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<strong>还书成功！</strong>
				</div>
			</c:when>
			<c:when test="${'201'==param.msg}">
				<div class="alert alert-warning alert-dismissible fade in"
					role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<strong>还书失败！</strong>
				</div>
			</c:when>
		</c:choose>
		<div class="starter-template">
			<h1 style="color: blue; font-family: Microsoft YaHei">欢迎登录图书管理系统！</h1>
			<h1 style="color: red;">${username}登陆成功！</h1>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">借书</h3>
				</div>
				<div class="panel-body">
					<form id="borrowbook" method="post" class="form-horizontal"
						action="/borrowbook" novalidate="novalidate">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="bookcode">书籍编号</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="bookcode"
									name="bookcode" placeholder="请输入书籍编号">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label" for="cardcode">借书卡号</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="cardcode"
									name="cardcode" placeholder="请输入借书卡号">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-9 col-sm-offset-4">
								<button type="submit" class="btn btn-primary" name="signup"
									value="提交">提交</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">还书</h3>
				</div>
				<div class="panel-body">
					<form id="borrowbook" method="post" class="form-horizontal"
						action="/rebook" novalidate="novalidate">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="bookcode">书籍编号</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="bookcode"
									name="bookcode" placeholder="请输入书籍编号">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label" for="cardcode">借书卡号</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="cardcode"
									name="cardcode" placeholder="请输入借书卡号">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-9 col-sm-offset-4">
								<button type="submit" class="btn btn-primary" name="signup"
									value="提交">提交</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script
		src="//cdn.bootcss.com/jquery-validate/1.15.0/jquery.validate.min.js"></script>
	<script>
		$(function() {
			$("#home").addClass("active");
			$("#borrowbook")
					.validate(
							{
								rule : {
									bookcode : "required",
									cardcode : "required",
								},
								message : {
									bookcode : "",
									cardcode : "",
								},
								errorElement : "span",
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
			$("#rebook")
					.validate(
							{
								rule : {
									bookcode : "required",
									cardcode : "required",
								},
								message : {
									bookcode : "",
									cardcode : "",
								},
								errorElement : "span",
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

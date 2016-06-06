<%@page import="com.it.entity.Book"%>
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
					<h3 class="panel-title">添加图书</h3>
				</div>
				<div class="panel-body">
					<form id="signupForm" method="post" class="form-horizontal"
						action="bookedit" novalidate="novalidate">
						<div class="form-group">
							<label class="col-sm-4 control-label" for="id">序号</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="id" name="id"
									placeholder="请输入序号" value="${book.id}">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-4 control-label" for="code">书籍编号</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="code" name="code"
									placeholder="请输入书籍编号" value="${book.code}">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label" for="title">书名</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="title" name="title"
									placeholder="请输入书名" value="${book.title}">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label" for="author">作者</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="author" name="author"
									placeholder="请输入作者" value="${book.author}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label" for="publising">出版社</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="publising" name="publising"
									placeholder="请输入出版社" value="${book.publishing}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label" for="total">总量</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="total" name="total"
									placeholder="请输入总量" value="${book.total}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label" for="count">剩余量</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="count" name="count"
									placeholder="请输入剩余量" value="${book.count}">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-9 col-sm-offset-4">
								<button type="submit" class="btn btn-primary" name="signup"
									value="修改">修改</button>
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
			$("#bookhome").addClass("active");
			$("#signupForm").validate({
				rule:{
					id:"required",
					code:"required",
					title:"required",
					author:"required",
					publising:"required",
					total:"required",
					count:"required",
				},
				message:{
					id:"",
					code:"",
					name:"",
					author:"",
					publishing:"",
					total:"",
					count:""
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
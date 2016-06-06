<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
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
<title>index</title>
<body>
	<%@ include file="/WEB-INF/views/nav.jsp"%>
	<div class="container">
	<form class="navbar-form navbar-left" role="search" action="/bookhome" method="get">
		<div class="form-group">
			<input type="text" class="form-control" placeholder="请输入查找条件" name="wd">
		</div>
		<button type="submit" class="btn btn-default">查找</button>
	</form>
		<a href="bookadd" type="button" class="btn btn-primary"
			style="float: right;">添加图书</a>
		<div class="starter-template">
			<div class="bs-example" data-example-id="bordered-table">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>序号</th>
							<th>书籍编号</th>
							<th>书名</th>
							<th>作者</th>
							<th>出版社</th>
							<th>总量</th>
							<th>剩余量</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="b" items="${list}">
						
						<tr>
							<th scope="row">${b.id}</th>
							<td>${b.code}</td>
							<td>${b.title}</td>
							<td>${b.author}</td>
							<td>${b.publishing}</td>
							<td>${b.total}</td>
							<td>${b.count}</td>
							<td><button type="button" data="${b.id}"
									class="btn btn-danger btn-xs">删除</button>
								<button type="button" class="btn btn-success btn-xs"
									data="${b.id}">修改</button></td>
						</tr>
						
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script>
		$(function() {
			$("td>button.btn-danger").click(function() {
				if (confirm("确认要删除吗？")) {
					var i = $(this).attr("data");
					location.href = "/bookdel?id=" + i;
				}
			});
			$("td>button.btn-success").click(function() {
				var i = $(this).attr("data");
				location.href = "/bookedit?id=" + i;
			});
			$("#bookhome").addClass("active");
		});
	</script>
</body>
</html>
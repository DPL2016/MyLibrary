<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<a href="/cardadd" type="button" class="btn btn-primary"
			style="float: right;">新建借书卡</a>
		<div class="starter-template">
			<div class="bs-example" data-example-id="bordered-table">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>编号</th>
							<th>姓名</th>
							<th>电话</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cd" items="${list}">
						<tr>
								<th scope="row">${cd.code}</th>
								<td>${cd.name}</td>
								<td>${cd.tel}</td>
								<td><button type="button" data="${cd.id}"
										class="btn btn-danger btn-xs">删除</button>
									<button type="button" class="btn btn-success btn-xs"
										data="${cd.id}">修改</button></td>
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
					location.href = "/carddel?id=" + i;
				}
			});
			$("td>button.btn-success").click(function() {
				var i = $(this).attr("data");
				location.href = "/cardedit?id=" + i;
			});
			$("#cardhome").addClass("active");
		});
	</script>
</body>
</html>
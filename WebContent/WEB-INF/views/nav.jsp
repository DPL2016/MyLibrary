<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("username") == null) {
		response.sendRedirect("/index.jsp");
	}
%>
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a style="color: orangered" class="navbar-brand" href="#">图书管理系统</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a id="home" style="color: greenyellow" href="/home">主页</a></li>
				<li><a id="cardhome" style="color: blueviolet" href="/cardhome">借书卡管理</a></li>
				<li><a id="bookhome" style="color: cyan" href="/bookhome">书籍管理</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">当前在线人数：<%=application.getAttribute("count") %></a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><%=session.getAttribute("username") %> <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">修改密码</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="/exit">安全退出</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>

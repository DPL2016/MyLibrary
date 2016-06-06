<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <title>index</title>
<body>
	<%
		String[] strs = {"aa","bb","cc","dd","ee"};
		pageContext.setAttribute("strs", strs);
		
	%>
	<c:forEach var="str" items="${strs}">
	<h1>${str}</h1>
	</c:forEach>
	
	
</body>
</html>
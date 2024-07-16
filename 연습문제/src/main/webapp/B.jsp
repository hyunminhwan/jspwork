<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String name=request.getParameter("name");
	String boo=request.getParameter("b");
	%>
	<%=name %>의 혈액형은 <%=boo%> 입니다.
	b형
</body>
</html>
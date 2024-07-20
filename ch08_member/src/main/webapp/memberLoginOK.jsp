<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3><%=id %>님이 로그인 하였습니다</h3>
	<h3><a href="memberLogout.jsp">로그아웃</a></h3>
</body>
</html>
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
	request.setCharacterEncoding("utf-8");
	String blood=request.getParameter("blood");
	String name =request.getParameter("name");

if(blood.equals("A")){
	%>
	<jsp:forward page="A.jsp"/>
	<% 
}else if(blood.equals("B")){
%>	
	<jsp:forward page="B.jsp"/>
<% 
}else if(blood.equals("AB")){
%>
	<jsp:forward page="AB.jsp"/>
<%	
}else{
%>
	<jsp:forward page="O.jsp"/>
<%
}
%>	

	
	

</body>
</html>
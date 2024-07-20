<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="regMgr" class="ch07.RegisterMgr"/>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	if(regMgr.loginRegister(id, pwd)){
		Cookie cookie = new Cookie("idKey",id);
		response.addCookie(cookie);
		//response.addCookie(new Cookie("idKey",id)); //한줄로
%>
<script type="text/javascript">
	alert("로그인 되었습니다");
	location.href="04.3.cookieLoginOK.jsp"
</script>



<%	
	}else{	
%>
<script type="text/javascript">
	alert("로그인이 되지 않았습니다");
	location.href="04.1.cookieLogin.jsp";
</script>		
<%	
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>
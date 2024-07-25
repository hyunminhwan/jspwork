<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.MemberMgr"/>
<%
	String id= request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	if(mMgr.loginRegister(id,pwd)){
		session.setAttribute("idKey", id);
	
%>
	<script type="text/javascript">
		alert('로그인 되었습니다');
		location.href="../index.jsp"
	</script>
<%
}else{
%>
	<script type="text/javascript">
		alert("로그인 되지 않았습니다");
		location.href="login.jsp";
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
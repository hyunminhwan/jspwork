<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cMgr" class="chun.chunMgr"/>
<%@ page import="chun.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  -->
<%
	String no = request.getParameter("id");
	String pw = request.getParameter("pwd");
	
		String msg ="로그인 실패 하였습니다.";
		if(cMgr.loginRegister(no, pw)){
			session.setAttribute("idKey", no);
			
			msg ="로그인 성공 하였습니다.";
	chunStudentBean	chun =cMgr.getStudent(no);
	session.setAttribute("chun",chun);
			
}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href="chunMain.jsp";
</script>
</body>
</html>
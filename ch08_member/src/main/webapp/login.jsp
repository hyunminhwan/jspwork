<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String id = (String)session.getAttribute("idKey");
	if(id != null){
%>
	<script type="text/javascript">
		location.href="memberLoginOK.jsp"
	</script>
<%
	}
%>

<style>
body{background-color: yellow;}

form{
	 width: 500px;
	 height: 300px;
	 background-color:white;
	 border: 1px solid;
	 margin: 0 auto;
	 margin-top: 300px;
	 /* line-height: 400px */
	 
}
form>div{
	 text-align: center;
}

</style>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="memberLoginProc.jsp" method="post" >
		<div>
		<h1>환영합니다</h1>
		<h1> *^^*</h1>
		ID : <input name="id" id="id"><p/>
		PW : <input type="password" name="pwd" id="pw"><p/>
		<input type="submit" value="로그인" id="login">
		<input type="button" value="회원가입" onclick="location.href='member.jsp'">
		
		</div>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
*{background-color :}
table {
	background-color : skyblue;
	margin-top: 200px;
	width: 400px;
}
</style>
<!-- 서버로부터 학번 받기 -->

<body>
	<form action="loginProc.jsp" method="post">
		<table align="center">
			<tr>
				<th colspan="2"><h3>춘대학교에 오신걸 환영합니다</h3></th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input name="id" id="id" required></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" id="pw" required></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>
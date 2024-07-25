<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	Board board=(Board)session.getAttribute("bean");

	
%>
<style>
*{margin: 0 auto; text-align: center;}
table {
	margin-top: 300px;
	width:300px;

}
</style>
<body>
	<form action="boardDelete" method="post">
		<table>
			<tr>
				<th>사용자의 비밀번호를 입력해 주세요</th>
			</tr>
			<tr>
				<td><input type="password" name="pass" required></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="삭제완료">
					<input type="reset" value="다시쓰기">
					<input type="button" value="뒤로" onclick="history.back()">
				</td>
			</tr>
		</table>
		<input type="hidden" name="num" value="<%=num%>">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
	</form>
</body>
</html>
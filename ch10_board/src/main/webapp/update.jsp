<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	Board board=(Board)session.getAttribute("bean");

%>
</head>
<style>
*{margin: 0 auto; background-color: yellow;}
table {
	margin-top: 200px;
	width: 800px;
	
}
.top{
background-color: gray;

}
.ta{
 text-align: center;
 width: 15%;
}
.in{
	margin-top : 30px;
	text-align: center;
}
</style>
<body>
	<form action="boardUpdate" method="post">
		<table>
			<tr>
				<th class="top" colspan="2">수정하기</th>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td class="ta">성명</td>
				<td><input name="name" value="<%=board.getName() %>"></td>
			</tr>
			<tr>
				<td class="ta">제목</td>
				<td><input name="subject" value="<%=board.getSubject()%>"></td>
			</tr>
			<tr>
				<td class="ta">내용</td>
				<td><textarea name="content" rows="10" cols="50" ><%=board.getContent() %></textarea></td>
			</tr>
			<tr>
				<td class="ta">비밀번호</td>
				<td><input type="password" name="pass" required>수정시에는 비밀번호가 필요합니다.</td>
			</tr>
			
			<tr>
				<td colspan="2"> 
					<hr>
					<input type="submit" value="수정완료" class="in">&emsp;
					<input type="reset" value="다시수정" class="in">&emsp;
					<input type="button" value="뒤로" class="in" onclick="history.go(-1)">
				</td>
				
			</tr>
		</table>
		<input type="hidden" name="num" value="<%=num%>">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
	</form>
</body>
</html>
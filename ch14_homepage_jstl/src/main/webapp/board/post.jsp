<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
*{margin: 0 auto; background-color: yellow;}
table {
	margin-top: 200px;
	width: 700px;
	
}
.top{
background-color: aqua;

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
	<form action="boardPost" method="post">
		<table>
			<tr>
				<th class="top" colspan="2">글쓰기</th>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td class="ta">성명</td>
				<td><input name="name"></td>
			</tr>
			<tr>
				<td class="ta">제목</td>
				<td><input name="subject"></td>
			</tr>
			<tr>
				<td class="ta">내용</td>
				<td><textarea name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td class="ta">비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			
			<tr>
				<td colspan="2"> 
					<hr>
					<input type="submit" value="등록" class="in">&emsp;
					<input type="reset" value="다시쓰기" class="in">&emsp;
					<input type="button" value="리스트" class="in" onclick="location.href='list.jsp'">
				</td>
				
			</tr>
		</table>
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
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
background-color: red;

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
	<form action="boardReply" method="post">
		<table>
			<tr>
				<th class="top" colspan="2">댓 글 등 록</th>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td class="ta">성명</td>
				<td><input name="name" ></td>
			</tr>
			<tr>
				<td class="ta">제목</td>
				<td><input name="subject" value="답변 : <%=board.getSubject()%>"></td>
			</tr>
			<tr>
				<td class="ta">내용</td>
				<td>
				<textarea name="content" rows="10" cols="50" ><%=board.getContent() %>======= 댓글을 작성하세요 =======
				</textarea>
				</td>
			</tr>
			<tr>
				<td class="ta">비밀번호</td>
				<td><input type="password" name="pass" required></td>
			</tr>
			
			<tr>
				<td colspan="2"> 
					<hr>
					<input type="submit" value="답변등록" class="in">&emsp;
					<input type="reset" value="다시쓰기" class="in">&emsp;
					<input type="button" value="뒤로" class="in" onclick="history.go(-1)">
				</td>
				
			</tr>
		</table>
		<!-- 앞에서 넘어온 값 -->
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<!-- 작성자의 ip -->
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
		<!-- 댓글을 쓰는 부모의 정보  -->
		<input type="hidden" name="ref" value="<%=board.getRef() %>">
		<input type="hidden" name="pos" value="<%=board.getPos() %>">
		<input type="hidden" name="depth" value="<%=board.getDepth() %>">
	</form>
</body>
</html>
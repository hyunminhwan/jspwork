<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="chun.*" %>    
    <% String id = (String)session.getAttribute("idKey");
    chunStudentBean chun =(chunStudentBean)session.getAttribute("chun");	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
*{margin: 0 auto; text-align: center;}
</style>
<body>
	<!-- 학생 정보 받기  -->
	<table>
		<tr>
			<th>학번</th>
			<th>학과</th>
			<th>이름</th>
			<th>입학일자</th>
			<th>휴학유무</th>
		</tr>
		<tr>
			<td><%=chun.getStudentNo() %></td><!-- 입력한 학번 -->
			<td><%=chun.getDepartmentNmae() %></td><!--  -->
			<td><%=chun.getStudentName() %></td><!--  -->
			<td><%=chun.getEntranceDate().substring(0,10) %></td><!--  -->
			<td><%=chun.getAbsenceYn() %></td><!--  -->
		</tr>
	</table>
</body>
</html>
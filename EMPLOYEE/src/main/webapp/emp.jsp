<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,ch.*" %>
<jsp:useBean id="empb" class="ch.beanPool" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>이메일</th>
			<th>핸드폰번호</th>
			<th>직급코드</th>
		</tr>
<%
	ArrayList<Bean> list = empb.getList();
		for(int i=0;i<list.size();i++){
			Bean bean =list.get(i);
		
%>
	<tr>
		<td><%=bean.getEmp_id()==null ? "":bean.getEmp_id()%></td>
		<td><%=bean.getEmp_name()==null ? "":bean.getEmp_name()%></td>
		<td><%=bean.getEmail()==null ? "": bean.getEmail()%></td>
		<td><%=bean.getPhone()==null ? "": bean.getPhone()%></td>
		<td><%=bean.getJob_code()==null ? "": bean.getJob_code() %></td>
	</tr>
	
<%
	}
%>

	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection con=null;
	Statement st =null;
	ResultSet rs =null;
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		con =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","tjoeun","1234");
		st = con.createStatement();
		rs = st.executeQuery("select*from emp_01");
%> 
	<table border="1" >
		<tr>
			<th>EMP_ID</th>
			<th>EMP_NAME</th>
			<th>DEPT_NAME</th>
		</tr>
<%
	while(rs.next()){
		String id = rs.getString(1);
		String EName = rs.getString(2);
		String DName = rs.getString(3);
%>
		<tr>
			<td><%=id %></td>
			<td><%=EName %></td>
			<td><%=DName %></td>
		</tr>

<%		
	}
%>

	</table>
<%	
	} catch (SQLException e) {
		System.out.println("접속오류");
		System.out.println(e);
	} catch (ClassNotFoundException e) {
		System.out.println("드라이버 오류");
		System.out.println(e);
	}finally {
		if(st != null) {
			try {st.close();} catch (SQLException e) {e.printStackTrace();}
		}
		if(rs != null) {
			try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			
		}
		if(con != null) {
			try {con.close();} catch (SQLException e) {e.printStackTrace();}
		}
	}
%>

</body>
</html>
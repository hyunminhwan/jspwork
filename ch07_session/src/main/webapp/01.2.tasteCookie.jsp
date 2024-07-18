<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Cookie[] cookie =request.getCookies();
		if(cookie != null){
			for(int i=0;i<cookie.length;i++){
				if(cookie[i].getName().equals("myCookie")){
					out.print("cookie Name : "+cookie[i].getName()+"<br>");
					out.print("cookie value : "+cookie[i].getValue()+"<br>");
				}
				//out.print("cookie Name : "+cookie[i].getName()+"<br>");
				//out.print("cookie value : "+cookie[i].getValue()+"<br>");
			}
		}
	%>
</body>
</html>
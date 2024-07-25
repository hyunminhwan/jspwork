<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<style>
* {
	margin: 0 auto;
	text-align: center;
}

table {
	border: 1px solid;
	width: 60%;
	height: 600px
}

tr, td {
	border: 1px solid;
}

td {
	text-align: left;
}

.list, .name {
	text-align: center;
}
</style>
<body>
	<h1>투표프로그램</h1>
	
	<hr>

	<h3>설문작성</h3>
	<hr>
	<form action="voteInsertProc.jsp" method="post">
		<table >
			<tr>
				<td class="name">질문</td>
				<td colspan="2">q:<input size="40" name="question"></td>
			</tr>
			<tr>
				<td rowspan="8" class="name">항목</td>
				<%
              	for(int i=1;i<=4;i++){
              		out.print("<td>"+(i*2-1)+":<input name='item'></td>");
              		out.print("<td>"+(i*2)+":<input name='item'></td>");
              		out.print("</tr>");
              		if(i<4)
              		out.print("<tr>");
              	}
              
              %>
				<!--<td>1:<input type="text"></td>
                <td>2:<input type="text"></td>
            </tr>
            <tr>
                <td>3:<input type="text"></td>
                <td>4:<input type="text"></td>
            </tr>
            <tr>
                <td>5:<input type="text"></td>
                <td>6:<input type="text"></td>
            </tr>
            <tr>
                <td>7:<input type="text"></td>
                <td>8:<input type="text"></td>
            </tr> -->
			<tr>
				<td>시작일</td>
				<td><select name="sdateY">
						<%
                			for(int i=2024;i<=2030;i++){
                				out.print("<option value='"+i+"'>"+i);
                			}
                		%>
				</select>년 <select name="sdateM">
						<%
                			for(int i=1; i<=12;i++){
                				out.print("<option value='"+i+"'>"+i);
                			}
                		%>
				</select>월 <select name="sdateD">
						<%
                			for(int i=1; i<=31;i++){
                				out.print("<option value='"+i+"'>"+i);
                			}
                		%>
				</select>일</td>
			</tr>
			<tr>
				<td>종료일</td>
				<td><select name="edateY">
						<%
                			for(int i=2024;i<=2030;i++){
                				out.print("<option value='"+i+"'>"+i);
                			}
                		%>
				</select>년 <select name="edateM">
						<%
                			for(int i=1; i<=12;i++){
                				out.print("<option value='"+i+"'>"+i);
                			}
                		%>
				</select>월 <select name="edateD">
						<%
                			for(int i=1; i<=31;i++){
                				out.print("<option value='"+i+"'>"+i);
                			}
                		%>
				</select>일</td>
			</tr>
			<tr>
				<td>이중답변</td>
				<td><input type="radio" id="YES" name="type" value="1"> 
					<label for="YES">YES</label> 
					<input type="radio" id="NO" name="type" value="0">
					<label for="NO">NO</label></td>
			</tr>
			<tr>
				<td colspan="3" class="list">
				<input type="submit" value="작성하기" >
				<input type="reset" value="초기화"> 
				<input type="button" value="리스트보기" onclick="location.href='voteList.jsp'"></td>
			</tr>
		</table>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img alt="" src="../resources/img1.png">
	<table>
		<thead>
			<tr>
				<td>댓글작성</td>
				<td>
					<textarea rows="3" cols="50"></textarea>
				</td>
				<td><button id="btn1"> 댓글등록</button></td>
			</tr>
		</thead>
		<tbody id="output1">
		
		
		</tbody>
	</table>
	
	<script type="text/javascript">
		$(()=>{
			selectReplyList();
		});
		
		function selectReplyList() {
			$.ajax({
				url:"rlist.bo",
				data : {bnum: "1"},
				
				success : function (result) {
					console.log(result);
					let value ="";
					for(let i=0; i<result.length; i++){
						 value +="<tr>"
						+"<td>"+result.no+"</td>"
						+"<td>"+result.name+"</td>"
						+"<td>"+result.content+"</td>"
						+"<td>"+result.redate+"</td>";
						
					}
					$("#output1").html(value);
				},
				error : function () {
					console.log("ajax 통신 실패");
				}
				
			})
		}
	</script>
</body>
</html>
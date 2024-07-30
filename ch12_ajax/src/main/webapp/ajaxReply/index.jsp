<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<img alt="" src="../resources/img1.png">
	<table id="output1" >
		<thead>
			<tr>
				<td>이름</td>
				<td><input id="name" name="name"></td>
			</tr>
			<tr>
				<td>댓글작성</td>
				<td>
					<textarea rows="3" cols="50" id="input"></textarea>
				</td>
				<td><button id="btn1"> 댓글등록</button></td>
			</tr>
			
		</thead>
		<tbody>
		
		
		</tbody>
	</table>
	
	<script type="text/javascript">
		$(()=>{
			selectReplyList();
			  $("#btn1").click(function () {
				$.ajax({
					url:"rlist1.bo",
					data :{
						reply: $("#input").val(),
						name : $("#name").val()
						},
					success : function (result) {
						console.log(result);
						location.href="index.jsp";
					},
					error : function () {
						console.log("ajax 통신 실패1");
					}
				
				})
				 
			})
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
						+"<td>"+result[i].no+"</td>"
						+"<td>"+result[i].content+"</td>"
						+"<td>"+result[i].name+"</td>"
						+"<td>"+result[i].redate.substring(0,10)+"</td>"
						+"</tr>";
						
					}
					console.log(value);
					$("table tbody").html(value);
					
				
				},
				error : function () {
					console.log("ajax 통신 실패2");
				}
				
			})
		}
		
		
		
		
		
		
		
	</script>
</body>
</html>
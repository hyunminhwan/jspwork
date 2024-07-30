<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.3/jquery-ui.min.js"></script>
<html>
<%
	String id =(String)session.getAttribute("idKey");
%>
<head>
<style type="text/css">
*{margin: 0 auto; list-style: none; text-decoration: none;}
body {width:1000px;}
h1{float : lefr; margin-top:20px;}
.nav{float:right;  margin-top: 20px; width: 800px; height: 20px;  }
.nav>li {
    float: left;
    text-align: center;
    width: 200px;
    background-color:rgb(245, 245, 234);
    padding: 10px 0;
}
.nav>li>a{font: 2em;}
header {height: 120px;}
#login {
   	clear :both;
    margin-top: 40px;
    padding-right: 20px;
}
.menu{
    float: left;
    cursor: pointer;
    position: relative;

}
.hov{
  background-color:rgb(245, 245, 234);
  display: none;
  z-index: 10;
  text-align: center;
}
</style>
<meta charset="UTF-8">
<title>메인 홈</title>
</head>
<body>

	<header>
		<div > <h1>춘대학교</h1> </div>
			<nav>
				<ul class="nav">
					<li class="menu">학생정보
					<% 
					if(id!=null){
					%>
						
						<ul class="hov">
							<li><a href="chunStudent.jsp">학생정보</a></li>
							<li><a href="">개인정보</a></li>
							<li><a href="">성적</a></li>
						</ul>
						
					<%
					}
					%>
					</li>
					<li><a href="">학과정보</a></li>
					<li><a href="">수강신청</a> </li>
					<%if (id==null){ %>
					<li><a href="chunLogin.jsp">로그인</a> </li>
					<%}else{ %>
					<li><a href="">로그아웃</a> </li>
					<%} %>
				</ul>
			</nav>
			<div id="login">
			<%if(id!=null){ %>
				<p>[<%=id %>님 로그인 상태]</p>
			<%} %>
			</div>
	</header>
	<article>
		<section>
			<img alt="풍경1" src="resources/img/img0.jpg">
		</section>
	</article>	
</body>
<script type="text/javascript">
	$(()=>{
		$('.menu').mouseenter(function () {
            $(this).children().stop().slideDown();
        });
        $('.menu').mouseleave(function () {
            $(this).children().stop().slideUp();
        });
		
	})
</script>

	
</html>
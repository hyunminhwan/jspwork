<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%
	String id = (String)session.getAttribute("idKey");
%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/index.css" rel="stylesheet">
</head>
<body>
	<header>
		<div class="logo"> 
			<img alt="로고" src="https://www.tjoeun.co.kr/images/logo.gif?v=20190918">
		</div>
			<nav>
				<ul class="nav">
					<li><a href="vote/voteList.jsp">투표프로그램</a> </li>
					<li><a href="board/list.jsp">게시판</a> </li>
					<c:choose>
						<c:when test="${empty idKey}">
							<li><a href="member/login.jsp">로그인</a> </li>
						</c:when>
						<c:otherwise>
							<li><a href="member/memberLogout.jsp">로그아웃</a> </li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
			<div id="login">
			<c:if test="${!empty idKey }">
				<p>${idKey}님 로그인 상태</p>
			</c:if>
			</div>
	</header>
	<article>
		<section>
			<img alt="풍경1" src="resources/img/img0.jpg">
		</section>
	</article>	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*,java.util.*" %>
<jsp:useBean id="bDao" class="board.BoardDao" />
<%
	request.setCharacterEncoding("utf-8");
	int totalRecord =0; //전체 레코드 수(board 테이블의 전체 행의 수)
	int numPerPage = 10; //1page에 보여줄 레코드(행)의 수
	int pagePerBlock = 5; // 블록당 페이지 수 [1][2][3][4][5] [next]
	
			
	int totalPage =0; //전체 페이지: 레코드수 67개라면,totalPage=[7]
	int totalBlock =0; //전체 블록 수 : 레코드수 67개라면, totalBlock = 2
	
	int nowPage =1; //현재 해당하는 페이지
	int nowBlock =1; //현재 해당하는 블록
	
	int start = 0; //board테이블의 select시 시작번호(한페이지에 필요한 만큼 게시물 가져오려고)
	int end = 0; //1page에 보여줄 레코드의 갯수(보통은 10개,맨 마지막page는 달라짐)
	int listSize = 0; //현재 읽어온 게시물의 수
	
	String keyField="",keyWord= "";
	
	if(request.getParameter("keyWord") != null){
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}
	
	if(request.getParameter("reload") !=null){
		if(request.getParameter("reload").equals("true")){
			keyField="";
			keyWord="";
		}
	}
	
	if(request.getParameter("nowPage") != null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	

	start = (nowPage*numPerPage)-numPerPage +1; //각 페이지당 시작번호
	end = nowPage*numPerPage;					//각 페이지당 끝나는 번호
	
	
	totalRecord = bDao.getTotalCount(keyField,keyWord);
	totalPage = (int)Math.ceil((double)totalRecord /numPerPage); //전체 페이지 수
	nowBlock = (int)Math.ceil((double)nowPage / pagePerBlock); //현재 속한 블럭
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock); //전체 블럭 계산
	
	
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
	*{margin: 0 auto; width: 1200px; }
	header>h1{
	margin-top: 60px;
	}
	table {
	
	}
	h3{
	text-align: left;
	margin-top: 60px;
	}
	.op{
	width: 300px;
	}

</style>
<script type="text/javascript">
	function block(value) {
		document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;
		document.readFrm.action = "list.jsp";
		document.readFrm.submit();
	}
	function pageing(page) {
		document.readFrm.nowPage.value=page;
		document.readFrm.action = "list.jsp";
		document.readFrm.submit();
	}
	function list() {
		/* document.listFrm.action = "list.jsp"; */
		document.listFrm.submit();
	}
	function read(num) {
		document.readFrm.num.value=num;
		document.readFrm.action ="read.jsp";
		document.readFrm.submit();
	}
</script>

<body>
	<div>
		<header>
			<h1>JSPBoard</h1>
		</header>
		<table class="table">
			<tr>
				<td  colspan="5"><h3>total :<%=totalRecord %>Articles<font color="red">
			(<%=nowPage %>/<%=totalPage %>page)</font></h3></td>
			</tr>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>이름</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		
				<%
				ArrayList<Board> blist =bDao.getBoardList(keyField,keyWord,start,end);
				listSize = blist.size();
					for(int i=0;i<listSize;i++){
						int depth = blist.get(i).getDepth();
				%>
			<tr>
				<td>
					<%=totalRecord-(nowPage-1)*numPerPage - i %>
				</td>
				<td>
					<%
						if(depth > 0){
							for(int j=0; j<depth; j++){
								out.print("&emsp;");
							}
							out.print("(❁´◡`❁)");
						}
					%>
					<a href="javascript:read('<%=blist.get(i).getNum() %>')" class="a"><%=blist.get(i).getSubject() %></a>
				</td>
				<td><%=blist.get(i).getName() %></td>
				<td><%=blist.get(i).getRegdate().substring(0,10) %></td>
				<td><%=blist.get(i).getCount() %></td>
			</tr>
				<%	
					}
				%>
			<tr>
				<td colspan="5" style="border:none;"><br></td>
			</tr>
			<tr id="set">
				<td colspan="3" >				
					<%
					int pageStart = (nowBlock-1)*pagePerBlock+1; //어디 블록 속하는지에 따른 
					int pageEnd = pageStart + pagePerBlock <= totalPage ? (pageStart + pagePerBlock):totalPage+1; //어디 블록 속하는지에 따른 마지막 페이지 
					
					if(totalPage != 0){
						if(nowBlock > 1){
							%>
							<a href="javascript:block('<%=nowBlock-1%>')">prev...</a>&emsp;
							<%
						}
						for(;pageStart<pageEnd;pageStart++){
							%>
							<a href="javascript:pageing('<%=pageStart%>')">[<%=pageStart %>]</a>
						<%
						}
						if(totalBlock > nowBlock){
							%>
							<a href="javascript:block('<%=nowBlock+1%>')">...next</a>&emsp;
							<%
						}
					}
	
					%>
			</td>
				<td colspan="2" style="text-align:right;">
					<a href="post.jsp" class="a">[글쓰기]</a>&emsp;
					<a href="javascript:list();" class="a">[처음으로]</a>&emsp;
					<a href="../index.jsp" class="a">[홈으로]</a>
				</td>
			</tr>
		</table>
		<form name="searchFrm" method="get" action="list.jsp">
			<table align="center" width="700">
				<tr>
					<td align="center">
						<select name="keyField" class="op" style="width: 150px;">
							<option value="name" >이름</option>
							<option value="subject" >제목</option>
							<option value="content" >내용</option>
						</select>
						<input name="keyWord" style="width: 300px;"  required>
						<input type="submit" style="width: 50px;" value="찾기">
					</td>
				</tr>
			</table>
		</form>
		<!-- 처음으로 누르면 화면 reload -->
		<form name="listFrm">
			<input type="hidden" name="reload" value="true">
			<input type="hidden" name="nowPage" value="1">
		</form>
		
		<!-- 사용자가 만약 [2]를 누르면 2번째 페이지 보여주기 -->
		<form name="readFrm">
			<input type="hidden" name="num">
			<input type="hidden" name="nowPage" value="<%=nowPage %>">
			<input type="hidden" name="keyField" value="<%=keyField %>">
			<input type="hidden" name="keyWord" value="<%=keyWord %>">
		</form>
	</div>
</body>
</html>		
		
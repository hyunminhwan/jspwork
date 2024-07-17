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
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String blood = request.getParameter("blood");
	%>
	<%=name%>의 혈액형은<%=blood%>입니다.<br> 
	당신은 멋지고 독립적이며 자신의 규칙을 따르고 다른 사람이 당신에 대해 어떻게 생각하는지 신경 쓰지 않습니다.<br>
	B형 혈액형을 가진 사람들은 인생을 최대한 즐기는 것을 좋아하고 그들에게 활력을 주는 것에 열정적입니다.<br> 그들은 항상 호기심이
	많아서 알지 못하는 사이에 충동적으로 만들 수도 있습니다.<br> 그러나 그들은 또한 사람들과 그들이 열정적이지 않은 것에 대해
	천박하고 이기적이며 게으른 것으로 간주됩니다. <br>혈액형 B형은 사교적이며 정직하고 마음이 따뜻한 사람입니다.<br> 그들은 쉽게 친구를
	사귀고 관심의 중심이 되는 것을 좋아합니다.<br> 이 혈액형을 가진 사람들은 자유를 중요하게 여기고 그들을 괴롭히는 모든 것에 대해
	말하는 것을 두려워하지 않으며, 이는 종종 다른 혈액형보다 훨씬 더 많은 적을 갖게 할 수 있습니다.<br> 한국 문화에서 이 혈액형을
	가진 남성은 종종 "나쁜 소년" 또는 "플레이보이"로 분류됩니다. <br>B형은 또한 강한 면역 체계를 가지고 있는 것으로 여겨집니다.
	<br><br>
	장점 : 개인주의적, 열정적, 낙관적, 사교적, 정직함 <br>
	최악의 특성: 참을성 없음, 무책임함, 자기 중심적임, 오만함,변덕스러움

</body>
</html>
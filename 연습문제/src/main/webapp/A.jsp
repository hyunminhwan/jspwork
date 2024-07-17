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
	String name=request.getParameter("name");
	String blood=request.getParameter("blood");
	%>
	<%=name %>의 혈액형은<%=blood%>입니다. <br>
	보수적이고 소심하며 다른 혈액형보다 더 내성적인 경우가 많은 A형 사람들은 종종 예민하고 감정을 표현하거나 다른 사람을
	신뢰하는 데 어려움을 겪습니다.<br> 그들은 또한 일을 개인적으로 받아들이고 쉽게 상처를 받을 수 있습니다.<br> 그러나 그들은 또한 다른
	사람들을 배려할 수 있고 참을성이 있으며 종종 시간을 잘 지킵니다.<br> A형은 또한 각 작업을 꼼꼼하게 완료하고 제대로 완료되었는지
	확인하기 위해 여분의 시간을 투자하는 완벽주의자입니다.<br> 그들은 사람들이 소중하게 여기고 신뢰하는 경향이 있는 근면하고 신뢰할 수
	있으며 책임감이 있습니다.<br> 하지만 완벽주의자이기 때문에 사소한 일과 불필요한 일에 휘말릴 수도 있습니다.<br> 당신은 그들이 약간의
	OCD를 갖는 경향이 있다고 말할 수 있습니다.<br> 술을 덜 참는다고 하며 채식을 할 때 가장 건강하다고 합니다. <br><br>
	최고의 특성:근면, 인내심, 사려깊음, 충성심, 창의적 <br>
	최악의 특성: 비밀스럽고, 폐쇄적이며, 자의식이 강하고, 강박적이며, 민감합니다.<br>
</body>
</html>
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
	<%=name %>의 혈액형은<%=blood%>입니다.<br>
	O형은 타고난 리더이자 다재다능한 사람입니다.<br> 그들은 외향적이고 낙관적이며 자신의 생각을 말하는 것을 두려워하지
	않습니다. <br>그들은 자신감 있게 대화를 나눌 수 있지만 말보다 행동으로 말하는 것이 훨씬 더 많습니다.<br> 혈액형 O형은 자신이 하는
	일에서 성공하기 위해 노력하는 야심찬 개인입니다. <br>노골적이고 정직하다는 것은 다른 사람들에게 자신의 의견을 내세우고 자신을
	낮추는 것으로 비칠 수도 있습니다. <br>사람들은 B형이 극적이고 거만하다고 생각할 수 있습니다. <br>그들은 지나치게 경쟁적이고 지는
	것을 싫어하므로 타협에 도달하거나 먼저 사과하는 것을 어렵게 만듭니다.<br> 이 혈액형을 가진 사람들은 고단백 식단과 일상적인 운동을
	따르는 것이 좋습니다. <br><br>
	최고의 특성: 다재다능함 , 야망, 자신감, 활기차고 친절함 <br>
	최악의 특성: 완고함, 거만함, 지나치게경쟁적임, 둔감함, 허영심
</body>
</html>
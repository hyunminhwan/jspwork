<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table{
    margin: 0 auto;
    width: 70%;
    height: 800px;
    background-color: aquamarine;
}
</style>
<script src="script.js?v=<%=System.currentTimeMillis() %>" charset="utf-8"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function findAddr(){
    new daum.Postcode({
        oncomplete: function(data) {
         let roadAddr = data.roadAddress; //도로명
		 let jibunAddr =data.jibunAddress; //지번
		 let extraAddr ='';
        
		 document.getElementById("postcode").value = data.zonecode;
         if(data.userSelectedType == 'R') {	// 사용자가 도로명을 선택했을 때
         	if(data.bname != '') {
         		extraAddr += data.bname;		// 동이름
         	}
         	if(data.buildingName != '') {
         		extraAddr += ', ' + data.buildingName;
         	}
         	roadAddr += extraAddr != '' ? '(' +  extraAddr + ')' : '';
				document.getElementById('addr').value = roadAddr;
         } else {
         	if(data.buildingName != '') {
         		extraAddr += data.buildingName;
         	}
         	jibunAddr += extraAddr != '' ? '(' +  extraAddr + ')' : '';
         	document.getElementById('addr').value = jibunAddr;
         }
         document.getElementById('detailAddr').focus();
     }
    }).open();}
</script>

<body>
    <form name="frm" method ="post" action="memberProc.jsp">
        <table border="1">
            <tr>
                <th colspan="3">회원가입</th>
            </tr>
            <tr>
                <td>아이디</td>
                <td><input type="text" name="id"  onkeydown="inputIdChk();">
                    <input type="button" value="ID중복확인" onclick="idCheck(this.form.id.value);">
                    <input type="hidden" name="idBtnCheck" value="idUncheck"> 
                </td>
                <td>영문과 숫자로만 입력.</td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="pwd"></td>
                <td>특수기호,영문,숫자가 각1개 이상씩 들어가야 되고 8글자 이상</td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td><input type="password" name="repwd"></td>
                <td>위의 비밀번호를 한번 더 넣으세요</td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" name="name"></td>
                <td>한글로 입력</td>
            </tr>
            <tr>
                <td>성별</td>
                <td>
                    <input type="radio" name="gender" value="1" id="man">
                    <label for="man">남자</label>
                    <input type="radio" name="gender" value="2" id="woman">
                    <label for="woman">여자</label>
                </td>
                <td>성별을 선택해 주세요</td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td><input name="birthday"></td>
                <td>6글자로 입력.ex)190315</td>
            </tr>
            <tr>
                <td>E-mail</td>
                <td><input type="email" name="email" size="30"></td>
                <td>ex)email@naver.com</td>
            </tr>
            <tr>
                <td>우편번호</td>
                <td>
                    <input type="text" name="zipcode" id="postcode" readonly>
                    <input type="button" value="우편번호찾기" onclick="findAddr();">
                </td>
                <td>우편번호를 검색하세요</td>
            </tr>
            <tr>
                <td>주소</td>
                <td>
                    <input type="text" name="address" id="addr" size="50" readonly><br>
                    <input type="text" name="detail_address" id="detailAddr">
                </td>
                <td>상세주소가 있으면 입력해주세요</td>
            </tr>
            <tr>
                <td>취미</td>
                <td>
                    <input type="checkbox" name="hobby" id="internet">
                    <label for="internet">인터넷</label>
                    <input type="checkbox" name="hobby" id="travel">
                    <label for="travel">여행</label>
                    <input type="checkbox" name="hobby" id="game">
                    <label for="game">게임</label>
                    <input type="checkbox" name="hobby" id="move">
                    <label for="move">영화</label>
                    <input type="checkbox" name="hobby" id="sports">
                    <label for="sports">운동</label>
                </td>
                <td>취미를 선택하세요</td>
            </tr>
            <tr>
                <td>직업</td>
                <td>
                    <select name="job" id="job1">
                        <option value="군인">군인</option>
                        <option value="경찰">경찰</option>
                        <option value="소방관">소방관</option>
                        <option value="프로그래머">프로그래머</option>
                        <option value="선생님">선생님</option>
                        <option value="연구원">연구원</option>
                        <option value="생산직">생산직</option>
                    </select>
                </td>
                <td>직업을 선택하세요</td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <input type="button" value="회원가입" onclick="inputCheck();">
                    <input type="reset"value="다시쓰기">
                    <input type="button" value="로그인" onclick="location.href='login.jsp'">
                </td>
            </tr>
        </table>
    </form>
</body>

</html>
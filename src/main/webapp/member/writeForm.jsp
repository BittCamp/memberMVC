<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- 2번 [ 김찬영  2023-09-7 오후 12:35:02 ]  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, tr, td{
		border: 1px solid black;
		border-collapse : collapse;
		padding : 7px;
	}
	#memberWriteForm table > div{
		font-size:8px;
		font-weight:bold;
		color:red;
	}
	.write {
		background:gray;
		color:white;
	}
	h2 {
		vertical-align: middle; /* 글씨를 세로로 가운데로 맞춤 */
   		display: table-cell;
		height : 70px;
		margin : 0;
		padding : 0;
	}
	hr {
		margin : 0;
		padding : 0;
		border-style: solid;
		border-color: lightgray;
		border-width: 2px;
	}
</style>
</head>
<body>
<form name="memberWriteForm" id="memberWriteForm" method="post" >	<!-- MVC타입은 action없어야된다. -->
	<div class="write"><h2>&nbsp;회원가입</h2></div>
	<hr>
	<table border="1">
		<tr>
			<th width="100">이 름</th>
			<td width="450"><input type="text" name="name" id="name" width="300" placeholder="이름 입력">
				<div id ="nameDiv"></div>
			</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" id="id" placeholder="아이디 입력" size="30">
				<input type="button" value="중복체크" onclick="checkId()">
				<input type="hidden" id ="sw" value="0">
				<div id="idDiv"></div>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pw1" id="pw1" value="" size="40">
				<div id ="pw1Div"></div>
			</td>
		</tr>
		<tr>
			<th>재확인</th>
			<td><input type="password" name="pw2" id="pw2" width="400" value="" size="40">
				<div id ="pw2Div"></div>
			</td>
		</tr>
		<tr>
			<th>성 별</th>
			<td><input type="radio" name="gender" id="gender" value="0" checked>남자
				<input type="radio" name="gender" id="gender" value="1">여자
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" name="email1" id="email1" style="width:120px;"> @
				<input type="email" name="email2" id="email2" style="width:120px;">
				<select name="email3" id="email3" style="width:120px;">
					<option value="직접입력" selected>직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="nate.com">nate.com</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>휴대폰</th>
			<td><select name="tel1" id="tel1" style="width:50px">
					<option value="010" selected>010</option>
					<option value="011">011</option>
					<option value="019">019</option>
				</select>
				- <input type="tel" name="tel2" id="tel2" size="5"> -
				<input type="tel" name="tel3"id="tel3" size="5">
			</td>
		</tr>
		<tr>
			<th>주 소</th>
			<td><input type="text" name="zipcode" id="zipcode" readonly>
				<input type="button" value="우편번호검색" id="checkPostBtn"><br>
				<input type="text" name="addr1" id="addr1" style="width:400px;" placeholder="주소" readonly>
				<input type="text" name="addr2" id="addr2" style="width:400px;" placeholder="상세주소">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="회원가입" id="writeBtn">
				<input type="reset" value="다시작성">
			</td>
		</tr>
	</table>
</form>
	<script type="text/javascript">
		function checkId(){
			//var id = document.폼이름.name속성명.value;
			//var id = document.getElementById("id").value;
			var id = document.getElementById("id").value;
			alert(id);
			if(id == "")
				document.getElementById("idDiv").innerText = "먼저 아이디를 입력하세요.";
			else
				window.open("http://localhost:8080/memberMVC/member/checkId.do?id="+id,"checkId","width=400 height=150 top=300 left=900");
		}
	</script>

	<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script type="text/javascript" src="../js/write.js"></script>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="../js/post.js"></script>
</body>
</html>
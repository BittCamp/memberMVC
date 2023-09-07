<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- 2번 [ 김찬영  2023-09-7 오후 12:35:02 ]  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, tr, td{
		padding-bottom : 7px;
		border-collapse : collapse;
		padding : 7px;
	}
	#loginForm div {
		color: red;
	}
</style>
</head>
<body>
	<form name="loginForm" id="loginForm" method="post" action="http://localhost:8080/memberMVC/member/login.do" > 
		<table border="1" cellspacing="0" cellpadding = "7">
			<tr>
				<td align="center" width="100">아이디</td>
				<td>
					<input type="text" name="id" id="id" size="15" placeholder="아이디 입력">
					<div id="idDiv"></div>
				</td>
			</tr>
			<tr>
				<td align="center">비밀번호</td>
				<td>
					<input type="password" name="pwd" id="pwd" size="20">
					<div id="pwdDiv"></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" id="loginBtn" value="로그인">
					<input type="button" id="writeBtn" value="회원가입" onclick="location.href='writeForm.jsp'">				
				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
	<script type="text/javascript">
	$(function (){
		$('#loginBtn').click(function(){
			$('#idDiv').empty();
			$('#pw1Div').empty();
			
			if($('#id').val()==''){
				$('#idDiv').text('아이디를 입력하세요.');
				$('#id').focus();
				return false;
			}else if($('#pw1').val()==''){
				$('#pw1Div').text('비밀번호를 입력하세요.');
				$('#pw1').focus();
				return false;
			}else{
				$('#loginForm').submit();
				//$.ajax({});
			}			
		});
	});
	</script>
</body>
</html>
<%@page import="member.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<jsp:include page="./menuList.jsp" />
<script>
	/* 인풋박스에 예외처리 : id/pw입력 검증 */
	function validateForm(form) {
		if (!form.user_id.value) {
			alert("아이디를 입력하세요");
			return false;
		}
		if (form.user_pw.value == "") {
			alert("패스워드를 입력하세요.");
			return false;
		}
	}
</script>

<h2>로그인 페이지</h2>
<span style="color: red; font-size: 1.2em;"> <%= request.getAttribute("LoginErrMsg") == null ?
				"" : request.getAttribute("LoginErrMsg") %>


</span>
<%
	
	memberDTO dto = new memberDTO();
	
	if (session.getAttribute("admin_id")!= null) { //로그인 성공시 출력용
	%>
관리자 아이디
<br />
관리자모드입니다
<br />

<a href="Logout.jsp">[로그아웃]</a>
<%	
	} else {
		if (session.getAttribute("user_id") == null){ //로그인 상태 확인
	%>


<form action="loginProcess.jsp" method="post" name="loginFrm"
	onsubmit="return validateForm(this);">
	아이디 : <input type="text" name="user_id" /><br> 패스워드 : <input
		type="password" name="user_pass" /> <br> <input type="submit"
		value="로그인하기" />
</form>
<!-- 로그인 폼 -->
<%

	} else {
		%>
		
		<%= session.getAttribute("user_name") %>
		회원님 로그인
		<br />
		<%= session.getAttribute("user_id") %>
		회원님 반가워요
		<br />
		<a href="Logout.jsp">[로그아웃]</a>
		
		<%
		}
	}
%>
</body>
</html>
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
	<jsp:include page="../Main/MenuListBootStrap.jsp" />
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
<div class="card mb-4">
<div class="card-body input-group" >
	<form class="mb-3" action="loginProcess.jsp" method="post" name="loginFrm"
		onsubmit="return validateForm(this);">
		<div class="row">
			<label class="form-label col-sm-2" for="id">ID</label>
			<div class="col-sm-10">
				<input id="id" type="text"  class="form-control" name="user_id" /><br>
			</div>
		</div>
		<label class="form-label" for="password">Password</label>
		<input id="password"	type="password" class="form-control" name="user_pass" /> <br>
		<button class="btn" type="submit" align="center">로그인하기</button>
	</form>
</div>
</div>
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
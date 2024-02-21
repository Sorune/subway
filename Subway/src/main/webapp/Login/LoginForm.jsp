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
        <header class="bg-image py-5" style="background-image: url('../img/main_sandwich01.jpg');background-size: cover;">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Subway!</h1>
                    <p class="lead fw-normal text-white-50 mb-0">This is amazing flavor</p>
                </div>
            </div>
        </header>
        
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
	<div class="container" align="center">
<span style="color: red; font-size: 1.2em;"> <%= request.getAttribute("LoginErrMsg") == null ?
				"" : request.getAttribute("LoginErrMsg") %>


</span>
<%
	
	memberDTO dto = new memberDTO();
	
	if (session.getAttribute("admin_id")!= null) { //로그인 성공시 출력용
		response.sendRedirect("../Main/main.jsp");
	} else {
		if (session.getAttribute("user_id") == null){ //로그인 상태 확인
	%>
<div class="card mb-4">
<div class="card-body input-group justify-content-center" align="center" >
	<form class="mb-3" action="loginProcess.jsp" method="post" name="loginFrm"
		onsubmit="return validateForm(this);">
		<div class="row">
			<label class="form-label col-sm-4" for="id">ID</label>
			<div class="col-sm-8">
				<input id="id" type="text"  class="form-control" name="user_id" /><br>
			</div>
		</div>
		<div class="row">
			<label class="form-label col-sm-4" for="password">Password</label>
			<div class="col-sm-8">
				<input id="password"	type="password" class="form-control" name="user_pass" /> <br>
			</div>
		</div>
		<div class="row">
			<button class="btn btn-primary" type="submit" align="right">로그인하기</button>
		</div>
	</form>
</div>
</div>
<!-- 로그인 폼 -->
<%

	} else {
		response.sendRedirect("../Main/main.jsp");
		}
	}
%>
</div>
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
</body>
</html>
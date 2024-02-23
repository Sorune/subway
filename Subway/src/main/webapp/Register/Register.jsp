<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"></script>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<jsp:include page="../Main/MenuListBootStrap.jsp" />
	<header class="bg-image py-5"
		style="background-image: url('../img/main_sandwich01.jpg'); background-size: cover;">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">Subway!</h1>
				<p class="lead fw-normal text-white-50 mb-0">This is amazing
					flavor</p>
			</div>
		</div>
	</header>
	<div class="container" align="center" style="min-width: 400px; max-width: 600px;">
		<div class="p-5 mb-4 bg-body-tertiary rounded-3" align="left">
			<h3 class="mb-0" align="left">회원가입</h3>
			<br />
			<form id="formAuthentication" class="mb-3"
				action="../Register/AddUser.jsp" method="POST">
				<div class="mb-3">
					<label for="email" class="form-label">ID</label>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="ID" name="id"
							aria-label="Recipient's username"
							aria-describedby="button-addon2" value="" />
						<button class="btn btn-outline-primary" type="button"
							id="button-addon2" onclick="location href='FindId.jsp';">중복확인</button>
					</div>
				</div>
				<!-- password -->
				<div class="mb-3 form-password-toggle">
					<label class="form-label" for="password">비밀번호</label>
					<div class="input-group input-group-merge">
						<input type="password" id="password" class="form-control"
							name="password"
							placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
							aria-describedby="password" value="" />
					</div>
				</div>

				<!-- 이름 -->
				<div class="mb-3">
					<label for="username" class="form-label">이름</label> <input
						type="text" class="form-control" id="username" name="name"
						placeholder="이름" autofocus value="" />
				</div>
				<!-- e-mail -->
				<div class="mb-3">
					<label for="username" class="form-label">e-mail</label> <input
						type="text" class="form-control" id="e-mail" name="phone"
						placeholder="연락처" autofocus value="" />
				</div>
				<!--주소 입력-->
				<div id="fullAdderess"></div>
				<div class="mb-3">
					<label for="adress" class="form-label">주소</label>
					<div class="input-group">
						<input type="text" class="form-control" id="postcode" name="add"
							placeholder="주소" aria-label="Recipient's adress"
							aria-describedby="button-addon2" value="" />
					</div>
				</div>
				<button class="btn btn-primary d-grid w-100">가입하기</button>
			</form>
			<div class="row">
				<div class="col text-center">
					아이디가 없으신가요?<a href="#none" class="btn-primary"
						style="text-decoration: none;">아이디 / 비밀번호찾기</a><br>
					<hr>
					이미 계정이 있으신가요?<a href="../Login/LoginForm.jsp" class="btn-primary"
						style="text-decoration: none;">로그인</a>
				</div>
			</div>

		</div>
	</div>
	<footer class="py-5 bg-dark">
		<p class="m-0 text-center text-white">Copyright &copy; Your
			Website 2023</p>
	</footer>

	<!--    <tr align="center">
      <form action="../Register/AddUser.jsp" method="post">
      아이디 : <input type="text" name="id" id="frm_id" value="" />
      비밀번호 : <input type="password" name="pass" value="" /><br />
      이름 : <input type="text" name="name" value="" /><br />
      전화번호 : <input type="text" name="phone" value="" /><br />
      주소 : <input type="text" name="add" value=" " /><br />
			<input type="submit" value="가입완료"  />
      </form>
   </tr> -->

</body>
</html>
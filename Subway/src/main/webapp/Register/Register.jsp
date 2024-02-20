<%@page import="util.JDBConnect"%>
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
<h4> 회원 가입 </h4>
<%
JDBConnect jdbc = new JDBConnect();

%>

   <tr align="center">
      <form action="../Register/AddUser.jsp" method="post">
      아이디 : <input type="text" name="id" id="frm_id" value="" /> <input type="button" id="check_button" value="ID 중복검사" onclick="checkid();"></button><br />
      비밀번호 : <input type="password" name="pass" value="" /><br />
      이름 : <input type="text" name="name" value="" /><br />
      전화번호 : <input type="text" name="phone" value="" /><br />
      주소 : <input type="text" name="add" value=" " /><br />
			<input type="submit" value="가입완료"  />
      </form>
   </tr>
</body>
</html>
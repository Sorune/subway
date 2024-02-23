<%@page import="util.JSFunction"%>
<%@page import="usercreate.UserDTO"%>
<%@page import="usercreate.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("user_id");
String pass = request.getParameter("user_pass");
String name = request.getParameter("user_name");
String phone = request.getParameter("user_phone");
String add = request.getParameter("user_add");

UserDAO dao = new UserDAO(application);
UserDTO dto = dao.Userselect("user_id");

String sessionId = session.getAttribute("user_id").toString();
if (!sessionId.equals(dto.getUser_Id())) {
   JSFunction.alertLocation("본인만 수정할 수 있습니다.", "./LoginForm.jsp", out);
} else {
   
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <jsp:include page="../Main/MenuListBootStrap.jsp" />
   <h4>회원 정보 수정하기</h4>
   <form name="UserFrm"method="post" ation="UpdateUser.jsp" onsubmit="return validateForm(this);">
      <table border="1" style="width: 90%; height: 90%;">
         <tr align="center">
            <td>아이디 : <input type="text" name="id" value="<%= dto.getUser_Id() %>" /><br />
               비밀번호 : <input type="text" name="pass" value="<%= dto.getUser_Pass() %>" /><br />
               이름 : <input type="text" name="name" value="<%= dto.getUser_Name() %>" /><br />
               전화번호 : <input type="hidden" name="phone" value="<%= dto.getUser_Phone() %>" /><br />
               주소 : <input type="hidden" name="add" value="<%= dto.getUser_Add() %>" /><br />
               <input type="submit" value="수정하기" />
            </td>
         </tr>
      </table>
   </form>

</body>
</html>
<%@page import="member.memberDTO"%>
<%@page import="member.loginDAO"%>
<%@page import="member.loginController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

String userid = request.getParameter("user_id"); //입력값
String userPwd = request.getParameter("user_pass");

String id = application.getInitParameter("admin_id");
String pw = application.getInitParameter("admin_pw");

if (userid != null && userid.equals(id)) {
	if(userPwd != null && userPwd.equals(pw)) {
	
		session.setAttribute("admin_id", id); //세션 영역에 id를 넣는다.
		response.sendRedirect("LoginForm.jsp");
		
		
	
		}// 일치시 관리자 메서드 로 이동
		
		
		System.out.println(id);
		System.out.println(pw);
}else {
	System.out.println(userid);
	//web.xml에 있는 JDBC 연결 정보를 가져옴
	String oracleDrv = application.getInitParameter("OracleDriver");
	String oracleURL = application.getInitParameter("OracleURL");
	String oracleID = application.getInitParameter("OracleId");
	String oraclePWD = application.getInitParameter("OraclePwd");
	System.out.println(oracleID);
	System.out.println(oraclePWD);

	//회원 테이블 DAO를 통한 회원 DTO 정보 가져오기
	loginDAO dao = new loginDAO(oracleDrv, oracleURL, oracleID, oraclePWD);

	memberDTO dto = dao.memberlogin(userid, userPwd);// 폼으로 받은 값을 처리하여 dto로 객체로 받음
	System.out.println(dto.getUser_id());

	dao.memberlogin(userid, userPwd);

	//로그인 성공 여부에 따른 처리
	if (dto.getUser_id().equals(userid)) { //dto객체에 id가 있으면 - 로그인 성공시!!!
		session.setAttribute("user_id", userid); //세션 영역에 id를 넣는다.
		session.setAttribute("user_name", dto.getUser_name()); //세션 영역에 name을 넣는다.
		response.sendRedirect("LoginForm.jsp");
	} else { //로그인 실패
		request.setAttribute("LoginErrMsg", "로그인 오류입니다. (id/pw를 확인하세요)");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}
	
}



%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>
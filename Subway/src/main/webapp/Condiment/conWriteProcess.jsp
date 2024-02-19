<%@page import="util.JSFunction"%>
<%@page import="DAO.CondimentDAO"%>
<%@page import="DTO.CondimentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	//폼값 받기
String conName = request.getParameter("name");
String conPrice = request.getParameter("price");
String conCount = request.getParameter("count");
String conKind = request.getParameter("kind");

//폼값을 DTO 객체에 저장
CondimentDTO dto = new CondimentDTO();
dto.setConName(conName);
dto.setConPrice(Integer.parseInt(conPrice));
dto.setConCount(Integer.parseInt(conCount));
dto.setConKind(conKind);
//menu_id 필요하면 추가
//DAO 객체를 통해 DB에 DTO 저장
CondimentDAO dao = new CondimentDAO(application);
int iResult = dao.insertWrite(dto);
dao.close();

// 성공 유무 확인
if(iResult == 1){	// 글쓰기가 성공하면 1값이 반환됨
	response.sendRedirect("conList.jsp");//게시판 목록을 돌아감
}else{
	JSFunction.alertBack("메뉴추가가 실패되었습니다.", out);
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
<%@page import="util.JSFunction"%>
<%@page import="DAO.CondimentDAO"%>
<%@page import="DTO.CondimentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
// 수정 내용 얻기
String menuId = request.getParameter("menu_id");
String conName = request.getParameter("name");
String conPrice = request.getParameter("price");
String conCount = request.getParameter("count");
String conKind = request.getParameter("kind");

// DTO에 저장
CondimentDTO dto = new CondimentDTO();
dto.setMenuId(Integer.parseInt(menuId) );
dto.setConName(conName);
dto.setConPrice(Integer.parseInt(conPrice) );
dto.setConCount(Integer.parseInt(conCount) );
dto.setConKind(conKind);

// DB에 반영
CondimentDAO dao = new CondimentDAO(application);
int affected = dao.updateEdit(dto);
dao.close();

if(affected ==1 ){
	// 성공 시 상세 보기 페이지로 이동
	response.sendRedirect("conView.jsp?menu_id=" + dto.getMenuId());
}else{
	// 실패시 이전 페이지로 이동
	JSFunction.alertBack("수정하기에 실패하였습니다.", out);
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
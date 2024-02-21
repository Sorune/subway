<%@page import="util.JSFunction"%>
<%@page import="DAO.CondimentDAO"%>
<%@page import="DTO.CondimentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String menuId = request.getParameter("menu_id");	// 일련번호 얻기
CondimentDTO dto = new CondimentDTO();				// DTO 객체 생성
CondimentDAO dao = new CondimentDAO(application);	// DAO 객체 생성
dto = dao.selectView(Integer.parseInt(menuId));		// 주어진 일련번호에 해당하는 기존 게시물 얻기

int delResult =0;

dto.setMenuId(Integer.parseInt(menuId));
delResult = dao.deletePost(dto);
dao.close();

//기능 필요하면	jsp 148p 참조
JSFunction.alertLocation(menuId + "번 삭제되었습니다. 기능필요시 148p", "conList.jsp", out);


%>
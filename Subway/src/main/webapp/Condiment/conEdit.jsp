<%@page import="DTO.CondimentDTO"%>
<%@page import="DAO.CondimentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String menuId = request.getParameter("menu_id");	// 일련번호 받기
CondimentDAO dao = new CondimentDAO(application);	// DAO 생성
CondimentDTO dto = dao.selectView(Integer.parseInt(menuId));// 게시물 가져오기
//관리자 로그인 확인해야한다.
//144p 참조할것

dao.close();	// DB 연결 해제
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고 게시판</title>
<script>
function validateForm(form){	// 폼 내용 검증
	if( form.name.value == ""){
		alert("제품이름을 입력하세요.");
		form.name.focus();
		return false;
	}
	if(form.price.value == ""){
		alert("가격을 입력하세요.");
		form.price.focus();
		return false;
	}
	if(form.count.value == ""){
		alert("수량을 입력하세요.");
		form.count.focus();
		return false;
	}
	if(form.kind.value ==""){
		alert("종류를 입력하세요")
		form.kind.focus();
		return false;
	}
}

function deletePost(){
	var confirmed = confirm("정말로 시작하겠습니까?");
	if(confirmed){
		var form = document.writeFrm;
	}
}

</script>
</head>
<body>
<jsp:include page="../Main/MenuListBootStrap.jsp"/>
<h2>상품정보 게시판 - 수정하기(Edit)</h2>
<form name="insertForm" method="post" action="conEditProcess.jsp"
	onsubmit="return validateForm(this);">
	<input type="hidden" name="menu_id" value="<%= dto.getMenuId() %>"/>
	<table border="1" width="90%">
		<tr>
			<td>메뉴번호</td>
			<td >
				<%= dto.getMenuId() %>
			</td>
		</tr>
		<tr>
			<td>제품이름</td>
			<td>
				<textarea name="name" style="width: 90%; height: 40px"><%= dto.getConName() %></textarea>
			</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>
				<textarea name="price" style="width: 90%; height: 60px"><%= dto.getConPrice() %></textarea>
			</td>
		</tr>
		<tr>
			<td>수량</td>
			<td>
				<textarea name="count" style="width: 90%; height: 60px"><%= dto.getConCount() %></textarea>
			</td>
		</tr>
		<tr>
			<td>종류</td>
			<td>
			<!--  <textarea name="kind" style="width: 90%; height: 60px"><%= dto.getConKind() %></textarea>-->
			<input type="text" name="kindId" list="kindId" style="width: 90%; height: 20px;"><br>
			<datalist id="kindId" >
				<option value="음료">
				<option value="사이드">
				<option value="소스">
				<option value="재료">
				<option value="빵">
			</datalist>
			
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">작성 완료</button>
				<button type="reset">다시 입력</button>
				<button type="button" onclick="location.href='conList.jsp';">
				목록 보기</button>
			</td>
		</tr>
	
	</table>
</form>
</body>
</html>
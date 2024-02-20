<%@page import="DTO.CondimentDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="DAO.CondimentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// DAO를 생성해 DB에 연결
CondimentDAO dao = new CondimentDAO(application);

// 사용자가 입력한 검색 조건을 Map에 저장
Map<String, Object> param = new HashMap<String, Object>();
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if(searchWord != null){
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}

int totalCount = dao.selectCount(param);	// 게시물 수 확인
List<CondimentDTO> condimentLists = dao.selectList(param);	// 게시물 목록 받기
dao.close();
%>
    
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./conHeadLink.jsp"/> <!-- 공통 링크 -->
	<h2>제품 목록 보기(conList)</h2>
	<form method="get">
	<table border="1" width="90%">
	<tr>
		<td align="center">
			<select name="searchField">
				<option value="menu_id">번호</option>
				<option value="name">이름</option>
			</select>
			<input type="text" name="searchWord"/>
			<input type="submit" value="검색하기"/>
		</td>
	</tr>
	</table>
	</form>
		<!-- 게시물 목록 테이블(표) -->
		<table border="1" width="90%">
			<!--  각 칼럼의 이름 -->
			<tr>
				<th width="10%">번호</th>
				<th width="35%">이름</th>
				<th width="15%">가격</th>
				<th width="10%">재고량</th>
				<th width="10%">종류</th>
				<th width="10%">수정</th>
				<th width="10%">삭제</th>
			</tr>
			<!--  목록의 내용 -->
<%
if(condimentLists.isEmpty()){
	//게시물이 하나도 없을때 }주의

%>		
		<tr>
			<td colspan="5" align="center">
			등록된 게시물이 없습니다.
			</td>
		</tr>


<%
}
else{
	//게시물이 있을 때
	int virtualNum = 0; // 화면상에서의 게시물 번호
	for(CondimentDTO dto : condimentLists ){
		virtualNum = totalCount--; // 전체 게시물 수에서 시작해 1씩 감소
%>	
		<tr align="center">
			<td><%= virtualNum %></td> <!-- 게시물 번호 -->
			<td align="Left"><%= dto.getConName() %></td>
			<td align="center"><%= dto.getConPrice() %></td>
			<td align="center"><%= dto.getConCount() %></td>
			<td align="center"><%= dto.getConKind() %></td>
			<td align="center">
				<button type = "button" onClick="location.href='conEdit.jsp?menu_id=<%= dto.getMenuId() %>'">수정하기</button>
			</td>
			<td align="center">
				<button type = "button" onclick="location.href='conDeleteProcess.jsp?menu_id=<%= dto.getMenuId() %>'">삭제하기</button>
			</td>
		</tr>
<% 	
	}
}

%>

		</table>
		<!--  목록 하단의 [글쓰기] 버튼 -->
		<table border="1" width="90%">
			<tr align="right">
				<td><button type="button" onclick="location.href='conWrite.jsp'";>글쓰기
				</button></td>
			</tr>
		</table>

</body>
</html>
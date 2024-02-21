<%@page import="util.BoardPage"%>
<%@page import="DTO.CondimentDTO"%>
<%@page import="DAO.CondimentDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>

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

// 전체 페이지 수 계산
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
int totalPage = (int)Math.ceil((double)totalCount / pageSize);	// 전체 페이지 수

//현재 페이지 확인
int pageNum = 1;
String pageTemp = request.getParameter("pageNum");
if(pageTemp != null && !pageTemp.equals(""))
	pageNum = Integer.parseInt(pageTemp);	// 요청받은 페이지로 수정

// 목록에 출력할 게시물 범위 계산
int start = (pageNum - 1) * pageSize + 1;	// 첫 게시물 번호
int end = pageNum * pageSize ;	//마지막 게시물 번호
param.put("start", start);
param.put("end" ,end);

List<CondimentDTO> condimentLists = dao.selectListPage(param);	// 게시물 목록 받기
dao.close();
%>
    
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>제품 목록 보기</title>
</head>
<body>
	<jsp:include page="../Main/MenuListBootStrap.jsp" />
	<div class="container" align="center">
		<div class="p-5 mb-4 bg-body-tertiary rounded-3" align="center" style="width: 100%; height: 150px">
			<h3 class="mb-0" align="left">재고 목록</h3><br/>
			
	<form  method="get">
	<table border="1" width="100%">
	<tr>
		<td align="center">
			<select name="searchField">
				<option value="menu_id">번호</option>
				<option value="con_name">이름</option>
				<option value="con_price">가격</option>
				<option value="con_count">재고량</option>
				<option value="con_kind">종류</option>
			</select>
			<input type="text"  name="searchWord"/>
			<input type="submit" class="btn btn-sm btn-primary" value="검색하기"/>
		</td>
	</tr>
	</table>
	</form>
		<!-- 게시물 목록 테이블(표) -->
		<table class="" border="1" width="100%" align="center" >
			<!--  각 칼럼의 이름 -->
			<tr align="center">
				<th width="10%">번호</th>
				<th width="30%">이름</th>
				<th width="20%">가격</th>
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
			<td colspan="7" align="center">
			등록된 게시물이 없습니다.
			</td>
		</tr>


<%
}
else{
	//게시물이 있을 때
	int virtualNum = 0; // 화면상에서의 게시물 번호
	int countNum =0;
	for(CondimentDTO dto : condimentLists ){
		//virtualNum = totalCount--; // 전체 게시물 수에서 시작해 1씩 감소
		virtualNum = totalCount - (((pageNum -1) * pageSize) + countNum++) ;
%>	
		<tr align="center">
			<td><%=dto.getMenuId()%></td> <!-- 게시물 번호 <%= virtualNum %>-->
			<td align="Left"><%= dto.getConName() %></td>
			<td align="center"><%= dto.getConPrice() %></td>
			<td align="center"><%= dto.getConCount() %></td>
			<td align="center"><%= dto.getConKind() %></td>
			<td align="center">
				<button type = "button" class="btn btn-sm btn-primary" onClick="location.href='conEdit.jsp?menu_id=<%= dto.getMenuId() %>'">수정하기</button>
			</td>
			<td align="center">
				<button type = "button" class="btn btn-sm btn-primary" onclick="location.href='conDeleteProcess.jsp?menu_id=<%= dto.getMenuId() %>'">삭제하기</button>
			</td>
		</tr>
<% 	
	}
}

%>

		</table>
		<!--  목록 하단의 [글쓰기] 버튼 -->
		<table border="1" width="100%" class="card-footer">
			<tr align="center">
				<!-- 페이징 처리 -->
				<td>
					<%=
					BoardPage.pagingStr(totalCount, pageSize,blockPage, pageNum, request.getRequestURI())
					%>
				</td>
				<td><button type="button" class="btn btn-sm btn-primary" onclick="location.href='conWrite.jsp';">제품추가
				</button></td>
			</tr>
		</table>
		</div>
	</div>
</body>
</html>
<%@page import="java.util.Vector"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.JDBConnect"%>
<%@page import="java.util.Map"%>
<%@page import="DTO.CondimentDTO"%>
<%@page import="DTO.OrderDTO"%>
<%@page import="DAO.OrderDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 게시물보기 - 전체를 보여줌
OrderDAO dao = new OrderDAO(); // OrderDAO 객체 생성
CondimentDTO cdto = new CondimentDTO();
Map<String, Object> param = new HashMap<String, Object>(); // 파라미터 생성용 맵
int totalCount = dao.selectCount(param); // 게시물 수 확인(위에서 만든 파라미터 값을 매개값으로 전달)
List<CondimentDTO> condimentLists = dao.selectList(param); // 게시물 목록 받기


dao.close(); // DB 연결 닫기

//게시물보기 - 탭메뉴 눌렀을시 보여줌
OrderDAO dao2 = new OrderDAO();

// System.out.println(request.getParameter("kind"));
String kind = request.getParameter("kind");
List<CondimentDTO> condimentLists2;
int totalCount2 = 0;
if (kind == null) {
	totalCount2 = dao2.findCount("빵"); // 게시물 수 확인(위에서 만든 파라미터 값을 매개값으로 전달)
	condimentLists2 = dao2.selectFindCountCount("빵"); // 게시물 목록 받기
} else {
	totalCount2 = dao2.findCount(request.getParameter("kind")); // 게시물 수 확인(위에서 만든 파라미터 값을 매개값으로 전달)
	condimentLists2 = dao2.selectFindCountCount(request.getParameter("kind")); // 게시물 목록 받기
}


dao2.close(); // DB 연결 닫기

int totalItemCount = dao.findCount(request.getParameter("name_id")); // 아이템 수량 확인(카테고리별 로드된 데이터의 값을 보여질 아이템의 넘버로 바꿔준다.)
List<CondimentDTO> condimentLists3 = dao.selectFindCountCount(request.getParameter("kind")); 


/* 
List<CondimentDTO> selectLists = new Vector<CondimentDTO>(); 
selectLists = (List<CondimentDTO>)session.getAttribute("selectLists");
if(request.getAttribute("menu_id") != null)selectLists.add(dao.selectCon(request.getAttribute("menu_id").toString()));
System.out.println(request.getAttribute("menu_id"));
for( CondimentDTO dto : selectLists){
	System.out.println(dto.getMenuId());
}
session.setAttribute("selectLists", selectLists);
*/
// 추가하기 버튼을 누르면 상세주문 페이지에 값이 들어가는 메서드

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>
<!-- includeCSS HERE -->
<link rel="stylesheet" type="text/css" href="../css/util.css">
<!-- innerCSS -->
<style type="text/css">
.menu_title>form>ul {
	display: flex;
}

.menu_main1_sub>table {
	overflow: scroll;
}

.menu_title>form>ul>li {
	list-style: none;
	margin-right: 5px;
	color: #ddd;
}

.menu_title>ul>li:hover {
	color: black;
}

#menu_sub_result {
	font-weight: bold;
}

.lastOrderTable {
	display: flex;
	justify-content: space-around;
	align-items: center;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../Main/MenuListBootStrap.jsp" />
	</header>
	<div class="container d-none">
		<form action="OrderMenuProcess.jsp" method="post" name="orderFrm"
			onsubmit="return orderValidate(this);">
			<ul class="d-flex">
				<%
				if (condimentLists2.isEmpty()) { // 메뉴가 없을 경우
				%> 
				<li>메뉴 :</li>
				<li>
					<select>
						<option>메뉴없음</option>
					</select>
				</li>
				<li>
					<select>
						<option>수량없음</option>
					</select>
				</li>	 
				<li>
					<input type="number" value="0"> 
				</li>
				<li>
					<input type="tel" placeholder="아이디가 없음" disabled="disabled">
				</li>
				<%
				%>
				<li>메뉴 :</li>
				<li>
					<select>
				<%
				} else { // 게시물이 있을 때
					int virtualNum = 0; // 화면상에서의 게시물 번호
					for (CondimentDTO condto : condimentLists2) {
						virtualNum = totalCount--; // 전체 게시물 수에서 시작해 1씩 감소
				%>
						<option><%=condto.getConName()%></option>
					</select>
				</li>
				<li>단가 :</li>
				<li>
					<select>
					<%
					
					%> 
				<%
				}
				}
				%>
				
				
				<input type="text" name="menu_name" value=""
					placeholder="메뉴 입력"></li>
				<li>단가 :</li>
				<li><input id="itemPrice" type="number" name="menu_qty_price"
					value="<%= cdto.getConPrice() %>" min="1" max="40000"></li>
				<li>수량 :</li>
				<li><input id="selNum" type="number" name="menu_qty" value="1"
					placeholder="수량 입력" min="1" max="10" onblur="multiply()"></li>
				<li>합계 금액 :</li>
				<li><input id="resultNum" type="number" name="menu_total_price"
					value=""></li>
				<li>주문자 아이디 :</li>
				<li><input type="text" name="order_userid" value=""
					placeholder="아이디 입력"></li>
				<li><input type="submit" value="주문하기"></li>
			</ul>
		</form>
	</div>
	<div class="menu_title container mart-5">
		<!-- 상단 탭 메뉴 (조건에 맞는 테이블로 변경기능)-->
		<form method="get">
			<ul>
				<li><input id="bread" type="submit" name="kind" value="빵"></li>
				<li><input id="topping" type="submit" name="kind" value="재료"></li>
				<li><input id="source" type="submit" name="kind" value="소스"></li>
				<li><input id="side" type="submit" name="kind" value="사이드"></li>
				<li><input id="beverage" type="submit" name="kind" value="음료"></li>
			</ul>
		</form>
	</div>
	<div class="menu_main container">
		<div class="menu_main1">
			<div class="menu_main1_title">
				<table class="table">
					<tr>
						<td class="col-2 text-nowrap text-center">상품 번호</td>
						<td class="col-4 text-nowrap text-center">상품 이름</td>
						<td class="col-3 text-nowrap text-center">상품 가격</td>
						<td class="col-3 text-nowrap text-center">주문 하기</td>
					</tr>
				</table>
			</div>
			<div class="menu_main1_sub">
				
					<table class="table h-50 overflow-scroll">
						<!-- 목록의 내용 -->
						<%
						if (condimentLists2.isEmpty()) {
							// 게시물이 하나도 없을 때
						%>
						<tr>
							<td class="col-12 text-nowrap text-center">메뉴가 없습니다 관리자를
								호출하세요.</td>
						</tr>
						<%
						} else {
						// 게시물이 있을 때 
						int virtualNum = 0; // 화면상에서의 게시물 번호
						int count = 1;
						for (CondimentDTO condto : condimentLists2) {
							virtualNum = totalCount--; // 전체 게시물 수에서 시작해 1씩 감소
						%>
						<tr align="center">
							<!--상품 아이디-->
							<td class="col-2 text-nowrap text-center"><%=count%></td>
							<!--상품 이름-->
							<td class="col-4 text-nowrap text-center"><%=condto.getConName()%></td>
							<!--상품 가격-->
							<td class="col-3 text-nowrap text-center"><%=condto.getConPrice()%></td>
							<!-- 추가하기 버튼 -->
							<td class="col-3 text-nowrap text-center">
							<form method="get">
								<button	class="btn btn-sm btn-primary" id="selectBtn" type="submit" name="menu_id" value=<%= condto.getMenuId() %>>추가하기</button>
								
							</form>
							</td>
						</tr>
						<%
							count ++;
							}
						}
						%>
					</table>

			</div>

		</div>
		<div class="menu_main2" style="display: none; background-color: red;">
			<table class="table h-50 overflow-auto">
				<!-- 목록의 내용 -->
				<%
				if (condimentLists2.isEmpty()) {
					// 게시물이 하나도 없을 때
				%>
				<tr>
					<td colspan="5" align="center">메뉴가 없습니다 관리자를 호출하세요.</td>
				</tr>
				<%
				} else {
				// 게시물이 있을 때 
				int virtualNum = 0; // 화면상에서의 게시물 번호
				for (CondimentDTO condto : condimentLists2) {
					virtualNum = totalCount--; // 전체 게시물 수에서 시작해 1씩 감소
				%>
				<tr align="center">
					<!--상품 아이디-->
					<td align="center"><%=condto.getMenuId()%></td>
					<!--상품 이름-->
					<td align="center"><%=condto.getConName()%></td>
					<!--상품 가격-->
					<td align="center"><%=condto.getConPrice()%></td>
				</tr>
				<%
				}
				}
				%>
			</table>
		</div>
		<div class="menu_main3" style="display: none; background-color: blue;">
			<table class="table h-50 overflow-auto">
				<!-- 목록의 내용 -->
				<%
				if (condimentLists2.isEmpty()) {
					// 게시물이 하나도 없을 때
				%>
				<tr>
					<td colspan="5" align="center">메뉴가 없습니다 관리자를 호출하세요.</td>
				</tr>
				<%
				} else {
				// 게시물이 있을 때 
				int virtualNum = 0; // 화면상에서의 게시물 번호
				for (CondimentDTO condto : condimentLists2) {
					virtualNum = totalCount--; // 전체 게시물 수에서 시작해 1씩 감소
				%>
				<tr align="center">
					<!--상품 아이디-->
					<td align="center"><%=condto.getMenuId()%></td>
					<!--상품 이름-->
					<td align="center"><%=condto.getConName()%></td>
					<!--상품 가격-->
					<td align="center"><%=condto.getConPrice()%></td>
				</tr>
				<%
				}
				}
				%>
			</table>
		</div>
		<div class="menu_main4" style="display: none;">
			<table class="table h-50 overflow-auto">
				<!-- 목록의 내용 -->
				<%
				if (condimentLists2.isEmpty()) {
					// 게시물이 하나도 없을 때
				%>
				<tr>
					<td colspan="5" align="center">메뉴가 없습니다 관리자를 호출하세요.</td>
				</tr>
				<%
				} else {
				// 게시물이 있을 때 
				int virtualNum = 0; // 화면상에서의 게시물 번호
				for (CondimentDTO condto : condimentLists2) {
					virtualNum = totalCount--; // 전체 게시물 수에서 시작해 1씩 감소
				%>
				<tr align="center">
					<!--상품 아이디-->
					<td align="center"><%=condto.getMenuId()%></td>
					<!--상품 이름-->
					<td align="center"><%=condto.getConName()%></td>
					<!--상품 가격-->
					<td align="center"><%=condto.getConPrice()%></td>
				</tr>
				<%
				}
				}
				%>
			</table>
		</div>
		<!-- 메뉴 추가 예시 -->
		<!-- <div class="menu_sub">
			<table class="table">
				<tr class="lastOrderTable">
					<td><img alt="" src="메뉴사진"
						style="width: 100px; height: 100px;"></td>
					<td><span>빵</span></td>
					설명
					<td><input type="number" id="menu_sub_price" value="3000"
						disabled="disabled"></td>
					단가
					<td><input id="menu_sub_qty" type="number" value="1" min="1"
						max="10" onblur="addMoney()"></td>
					수량
					<td><span id="menu_sub_result"></span></td>
					단가 * 수량
					<td></td>
				</tr>
			</table>
		</div> -->
	</div>
	<div class="orderTotalView container">
		<form action="../Cart/Cart.jsp" method="post">
			<table class="table">
				<tr>
					<td class="col-12 text-nowrap text-center">주문내역입니다.</td>
				</tr>
				<tr>
					<td class="col-4 text-nowrap text-center">선택수량 : <input
						type="text" id="totalQty" disabled="disabled"></td>
					<td class="col-4 text-nowrap text-center">합계금액 : <input
						type="text" id="totalPrice" disabled="disabled"></td>
					<td class="col-4 text-nowrap text-center">주 문 : <input
						type="submit" value="주문하기"></td>
				</tr>
			</table>
		</form>
		<!-- 선택 가능한 제품을 selectbox로 보여준다 -->
		<%-- 			<%
			if (condimentLists.isEmpty()) {
				// 게시물이 하나도 없을 때
			%>
			<tr>
				<td><select>
						<option>---</option>
				</select></td>
				<td><select>
						<option>---</option>
				</select></td>
				<td><select>
						<option>---</option>
				</select></td>
				<td><span>0원</span></td>
			</tr>
			<%
			} else {
			// 게시물이 있을 때
			%>
			<tr align="center">
				<td colspan="5">
					<form action="OrderMenuProcess.jsp" method="post">
						<select>
							<!-- 빵선택 -->
							<option name="selectMenu">선택하세요</option>
							<%
							int virtualNum2 = 0; // 화면상에서의 게시물 번호
							for (CondimentDTO condto : condimentLists) {
								virtualNum2 = totalCount--; // 전체 게시물 수에서 시작해 1씩 감소
							%>
							<option name="selectMenu">
								<%=condto.getConName()%>
							</option>
							<%
							}
							%>
						</select> <select>
							<!-- 재료선택 -->
							<option name="selectMenu">선택하세요</option>
							<%
							int virtualNum3 = 0; // 화면상에서의 게시물 번호
							for (CondimentDTO condto : condimentLists) {
								virtualNum2 = totalCount--; // 전체 게시물 수에서 시작해 1씩 감소
							%>
							<option name="selectMenu">
								<%=condto.getConName()%>
							</option>
							<%
							}
							%>
						</select> <select>
							<!-- 사이드선택 -->
							<option name="selectMenu">선택하세요</option>
							<%
							int virtualNum4 = 0; // 화면상에서의 게시물 번호
							for (CondimentDTO condto : condimentLists) {
								virtualNum2 = totalCount--; // 전체 게시물 수에서 시작해 1씩 감소
							%>
							<option name="selectMenu">
								<%=condto.getConName()%>
							</option>
							<%
							}
							%>
						</select> 총금액 : <span></span> <input type="submit" value="장바구니담기">
					</form>
				</td>
			</tr>
			<%
			}
			%>
		</table> --%>
	</div>

	<script type="text/javascript">
		// 주문 시 빠진 입력이 존재 할 경우 경고창을 출력해주는 메서드 --> false시 나타나므로 jsp로 이동이 안됨.
		
		function orderValidate(form) {
			if (!form.menu_name.value) {
				alert("메뉴를 입력하세요");
				return false;
			}
			if (!form.menu_qty.value) {
				alert("수량을 입력하세요");
				return false;
			}
			if (!form.menu_total_price.value) {
				alert("금액을 입력하세요");
				return false;
			}
			if (!form.order_userid.value) {
				alert("아이디를 입력하세요");
				return false;
			}
		}

		// 수량과 단가를 곱해서 보여주는 메서드
		addMoney();

		function addMoney() {
			var menu_sub_qty = document.getElementById("menu_sub_qty").value;
			var menu_sub_price = document.getElementById("menu_sub_price").value; // 단가
			var changeNum = parseInt(menu_sub_price);
			var menu_sub_result = document.getElementById("menu_sub_result"); // 합산금액 나오는 span
			menu_sub_result.innerText = menu_sub_qty * changeNum + " 원";
		}

		// 페이지 전환 메서드
		/* pageChange();
		
		function pageChange() {
			var changeBreadBtn = document.getElementById("bread");
			var changeToppingBtn = document.getElementById("topping");
			var changeSideBtn = document.getElementById("side");
			var changeBeverageBtn = document.getElementById("beverage");
			// 보여줄 페이지
			var changePage1 = document.getElementsByClassName("menu_main1")[0];
			var changePage2 = document.getElementsByClassName("menu_main2")[0];
			var changePage3 = document.getElementsByClassName("menu_main3")[0];
			var changePage4 = document.getElementsByClassName("menu_main4")[0];
			changeBreadBtn.addEventListener("click", ()=>{
				changePage1.style.display = "block";
				lo
				changePage2.style.display = "none";
				changePage3.style.display = "none";
				changePage4.style.display = "none";
			});
			changeToppingBtn.addEventListener("click", ()=>{
				changePage1.style.display = "none";
				changePage2.style.display = "block";
				
				changePage3.style.display = "none";
				changePage4.style.display = "none";
			});
			changeSideBtn.addEventListener("click", ()=>{
				changePage1.style.display = "none";
				changePage2.style.display = "none";
				changePage3.style.display = "block";
				
				changePage4.style.display = "none";
			});
			changeBeverageBtn.addEventListener("click", ()=>{
				changePage1.style.display = "none";
				changePage2.style.display = "none";
				changePage3.style.display = "none";
				changePage4.style.display = "block";
				
			});
		} */

		// 테스트오더 메뉴에서 메뉴와 금액을 곱해서 합계금액으로 보여주는 메서드
		multiply();

		function multiply() {
			var menu_sub_qty = document.getElementById("selNum").value;
			var menu_sub_price = document.getElementById("itemPrice").value
			var resultInput = document.getElementById("resultNum");
			resultInput.value = menu_sub_qty * menu_sub_price;

		}
	</script>

</body>
</html>
<%@page import="java.util.Vector"%>
<%@page import="DTO.OrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제창</title>

<%
String user_name ="";
String user_add ="";
String user_phone ="";
String pay_kind = "";
String order_kind = "";
List<OrderDTO> cartLists = (Vector<OrderDTO>)session.getAttribute("cartLists");
%>

        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
</head>
<body>

<jsp:include page="../Main/MenuListBootStrap.jsp" />
	<% if(cartLists == null || cartLists.size() < 1) { 
	 	%>
		<script>
			alert("장바구니가 비어있습니다.");
			location.href='./Cart.jsp';
		</script>
		<%
	} else {
	%>
   <!-- 결제창 값 입려  -->
	<div class="container" align="center">
	   <div class="p-5 mb-4 bg-body-tertiary rounded-3" align="center" style="width: 75%; height: 150px">
	   <h3 class="mb-0" align="left">Payment</h3><br/>
	   <form action="PaymentProcess.jsp" method="post" class="card authentication-inner" >
	   <table class="table card-header">
	      <tr>
	         <td width="*"><h5 >메뉴</h5></td>
	         <td><%= cartLists.get(0).getMenu_name() %> &nbsp; | &nbsp; <%= cartLists.get(0).getMenu_qty() %></td>
	      </tr>
	      <tr>
	         <td width="35%"><h5 >결제하실 금액</h5></td>
	         <td><%= cartLists.get(0).getMenu_total_price() %>&nbsp;원</td>
	      </tr>
	   
	      <tr>
	         <td width="30%"><h5>필수선택사항</h5></td>
	         <td>
	         <label for="배달">배달</label>
	         <input type="radio" name="order_kind"  value="배달" class="form-check-input" id="delivery" />
	         <label for="포장">포장</label>
	         <input type="radio" name="order_kind"  value="포장" class="form-check-input" />
	         <label for="매장식사">매장식사</label>
	         <input type="radio" name="order_kind"  value="매장식사" class="form-check-input" />
	         </td>
	      </tr>
	      
	<%--       <form method="post" >
	      <tr>
	         <td width="30%"><h5 class="card-header">주문자</h5>
	         <td><input type="text" style="display: none;" id="deliveryi" name="user_add" value="<% user_name %>" placeholder="<%= session.getAttribute("user_name") %>"/></td>
	      </tr>
	      <tr>
	         <td width="30%"><h5 class="card-header">주소</h5>
	         <td><input type="text" style="display: none;" id="deliveryi" name="user_add" value="<%= user_name %>" placeholder="<%= session.getAttribute("user_add") %>"/></td>
	      </tr>
	      <tr>
	         <td width="30%"><h5 class="card-header">연락처</h5>   
	         <td><input type="text" style="display: none;" id="deliveryi" name="user_pohone" value="<%= user_phone %>" placeholder="<%= session.getAttribute("user_phone") %>"/></td>
	      </tr>
	      </form> --%>
	   
	      <tr>
	         <td>결제방식</td>
	         <td>
	         <input type="button" class="btn btn-sm btn-primary" name="PayType" value="현금결제" id="money"  />
	         <input type="button" class="btn btn-sm btn-primary" name="PayType" value="카드결제" id="card"   />
	         <input type="button" class="btn btn-sm btn-primary" name="PayType" value="기프티콘" id="gift"   />
	         <input type="text" class="form-control" style="display: none;" id="moneyi" name="pay_kind" value="<%= pay_kind %>" placeholder="넣으실 금액" /> <!-- 존재하지만 안보임 -->
	         <input type="text" class="form-control" style="display: none;" id="cardi" name="pay_kind" value="<%= pay_kind %>" placeholder="카드번호입력"  /> <!-- 존재하지만 안보임 -->
	         <input type="text" class="form-control" style="display: none;" id="gifti" name="pay_kind" value="<%= pay_kind %>" placeholder="기프티콘 일련번호"  /> <!-- 존재하지만 안보임 -->
	         </td>
	      </tr>   
	      <td style="display: none;"><input type="date" name="order_date" value="<%= cartLists.get(0).getOrder_date()%>"> </td>
	      <td style="display: none;"><input type="text" name="user_id" value="<%= cartLists.get(0).getOrder_userid()%>"> </td>
	      
	      <!-- 결제div -->
	         <tr align="center" >
	            <td width="100%" colspan="8">
	            <button type="submit" class="btn btn-primary" name ="payment">결제하기</button>
	            <button type="reset" class="btn btn-primary" onclick="history.back()">이전으로</button></td>
	         </tr>
	</table>
	</form>
	</div>
	</div>
	<% } %>
<script type="text/javascript">
   
showinput();

function showinput(form) {
    var targetBtn1 = document.getElementById("card");
    var targetBtn2 = document.getElementById("money");
    var targetBtn3 = document.getElementById("gift");
    var targetBtn4 = document.getElementById("delivery");
   
    
    targetBtn1.addEventListener('click', ()=> {
            document.getElementById('cardi').style.display="block";
            document.getElementById('moneyi').style.display="none";
            document.getElementById('gifti').style.display="none";
    });
    targetBtn2.addEventListener('click', ()=> {
            document.getElementById('moneyi').style.display="block";
            document.getElementById('cardi').style.display="none";
            document.getElementById('gifti').style.display="none";
    });
    targetBtn3.addEventListener('click', ()=> {
            document.getElementById('gifti').style.display="block";
            document.getElementById('moneyi').style.display="none";
            document.getElementById('cardi').style.display="none";
    });
    targetBtn4.addEventListener('change ', ()=> {
            document.getElementById('deliveryi').style.display="block";
           
    });
}
</script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</body>

</html>
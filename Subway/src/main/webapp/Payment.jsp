<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제창</title>

<%
String pay_kind = "";
String order_kind = "";
%>

        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
</head>
<body>

<jsp:include page="menuList.jsp" />

	<!-- 결제창 값 입력  -->
	<div class="p-5 mb-4 bg-body-tertiary rounded-3" align="center" style="width: 55%; height: 150px">
	<h3 class="mb-0" align="left">Payment</h3><br/>
	<form action="PaymentProcess.jsp" method="post" >
	<table border="1" class="table">
		<tr>
			<td width="*"><h5 class="card-header">메뉴</h5></td>
			<td><%=session.getAttribute("menu_name") %> &nbsp; | &nbsp; <%= session.getAttribute("menu_qty") %></td>
		</tr>
		<tr>
			<td width="35%"><h5 class="card-header">결제하실 금액</h5></td>
			<td><%= session.getAttribute("menu_total_price") %>원</td>
		</tr>
		<tr>
			<td width="30%"><h5 class="card-header">필수선택사항</h5></td>
			<td>
			<label for="배달">배달</label>
			<input type="radio" name="order"  value="배달" class="form-check-input" />
			<label for="포장">포장</label>
			<input type="radio" name="order"  value="포장" class="form-check-input" />
			<label for="매장식사">매장식사</label>
			<input type="radio" name="order"  value="매장식사" class="form-check-input" />
			</td>
		</tr>
	
		<tr>
			<td>결제방식</td>
			<td>
			<input type="button" class="btn btn-sm btn-primary" name="PayType" value="현금결제" id="money"  />
			<input type="button" class="btn btn-sm btn-primary" name="PayType" value="카드결제" id="card"   />
			<input type="button" class="btn btn-sm btn-primary" name="PayType" value="기프티콘" id="gift"   />
			<input type="text" class="form-control" style="display: none;" id="moneyi" name="thisInput" value="<%= pay_kind %>" placeholder="넣으실 금액" /> <!-- 존재하지만 안보임 -->
			<input type="text" class="form-control" style="display: none;" id="cardi" name="thisInput" value="<%= pay_kind %>" placeholder="카드번호입력"  /> <!-- 존재하지만 안보임 -->
			<input type="text" class="form-control" style="display: none;" id="gifti" name="thisInput" value="<%= pay_kind %>" placeholder="기프티콘 일련번호"  /> <!-- 존재하지만 안보임 -->
			</td>
		</tr>	
		
		<!-- 결제div -->
		<div class="card-body">
				<table width="90%">
			<tr align="center" >
				<td width="100" colspan="8">
				<button type="submit" class="btn btn-primary" name ="payment">결제하기</button>
				<button type="reset" class="btn btn-primary" onclick="location.href='Order.jsp'">이전으로</button></td>
			</tr>
		</table>
		</div>
		
	</div>		
	</form>
	</table>

<script type="text/javascript">
	
showinput();

function showinput(form) {
    var targetBtn1 = document.getElementById("card");
    var targetBtn2 = document.getElementById("money");
    var targetBtn3 = document.getElementById("gift");
    
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
}

	


</script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</body>

</html>
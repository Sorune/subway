<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
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
</script>
<jsp:include page="./conHeadLink.jsp"/>
<h2>새메뉴 추가</h2>
<form name="insertForm" method="post" action="conWriteProcess.jsp"
		onsubmit="return validateForm(this);">
	<table border="1" width="90%">
		<tr>
			<td>제품이름</td>
			<td>
				<input type="text" name="name" style="width:90%;"/>
			</td>
		</tr>
		<tr>
			<td>가격</td>
			<td>
				<textarea name="price" style="width: 90%; height: 30px"></textarea>
			</td>
		</tr>
		<tr>
			<td>수량</td>
			<td>
				<textarea name="count" style="width: 90%; height: 30px"></textarea>
			</td>
		</tr>
		<tr>
			<td>종류</td>
			<td>
			<textarea name="kind" style="width: 90%; height: 30px"></textarea>
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
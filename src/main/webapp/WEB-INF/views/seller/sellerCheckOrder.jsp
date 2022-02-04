<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 확인</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <script src="/resources/js/file.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="sellerheader.jsp" />
	<jsp:include page="sellersidebar.jsp" />
	
	<div class="container" style=" font-size : small;">
		<h3>주문 내역</h3>
		<table class="table">
			<tr>
				<th scope="col">회원아이디</th>
				<!-- <th scope="col">이미지</th> -->
				<th scope="col">상품명</th>
				<th scope="col">제품수량</th>
				<th scope="col">제품가격</th>
				<th scope="col">배송상태</th>
				<th scope="col">결제일</th>
				<th scope="col">배송상태변경</th>
			</tr>
			<c:forEach items="${pt.list}" var="vo" varStatus="i">
				<form action="/order/manager/status">
					<input name="status" value="${vo.status}" type="hidden">

					<tr>
						<td>${vo.member_id}</td>
						<%-- <td><div data-item_no="${vo.item_no}" data-item_name="${vo.item_name}" data-file_name="${vo.file_name}" class="uploadedList${i.index}"></div></td> --%>
						<td><a style="text-decoration: none; color: #000;" href="/item/read/${vo.item_no}">${vo.item_name}</a></td>
						<td>${vo.ea}</td>
						<td>${vo.price}</td>
						<td>${vo.status}<a href="/exchangeRefund/requestpage?member_id=${vo.member_id }&order_id=${vo.order_id }&price=${vo.price }&order_date=${vo.order_date }&ea=${vo.ea }" class="badge badge-info"> 정보 </a></td>
						<td><fmt:formatDate value="${vo.order_date}"
								pattern="yyyy-MM-dd HH:ss" /></td>
						<td><select name="status" class="form-select">
								<option selected value="${vo.status}">${vo.status}</option>
								
								<option value="배송중">배송중</option>
								<option value="배송완료">배송완료</option>
								<option value="환불교환 취소">환불교환 취소</option>
								<option value="교환완료">교환완료</option>
								<option value="환불완료">환불완료</option>
						</select>
							<button data-order_id="${vo.order_id}" type="button" class="btn_status btn-outline-secondary">변경</button>
						</td>
					</tr>
				</form>
			</c:forEach>
		</table>
		<div style="margin-left: 40%">
		<jsp:include page="../seller/pageseller.jsp" />
		</div>
	</div>
		<jsp:include page="../footer.jsp" />
<script type="text/javascript">
	var status = "";
	
	$(document).ready(function() {
		
	$("select[name=status]").change(function() {
		status = $(this).val();
	});
	
	$(".btn_status").click(function(event) {
		event.preventDefault();
		var order_id = $(this).attr("data-order_id");
		$.ajax({
			type : 'post',
			url : "/order/status/"+status+"/"+order_id,
			dataType : 'text',
			success : function(result){
				alert("상품상태가 변경 되었습니다");
				window.location.reload();
			}
			
		});
	})
	});

</script>
</body>
</html>
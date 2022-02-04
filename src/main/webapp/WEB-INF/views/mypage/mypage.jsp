<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style type="text/css">
.container{
max-width: 1050px;
float: left;
}
</style>
</head>
	<jsp:include page="../header.jsp" />
	<jsp:include page="mSidebar.jsp" />
<body>
<div class="container" style="font-size: small;">
<h4>최근 주문내역</h4>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">주문번호</th>
				<th scope="col">제품수량</th>
				<th scope="col">제품가격</th>
				<th scope="col">배송상태</th>
				<th scope="col">결제일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${ovo}" var="ovo">
				<tr>
				<td>${ovo.order_id}</td>
				<td>${ovo.ea}</td>
				<td>${ovo.price}</td>
				<td>${ovo.status}</td>
				<td>${ovo.order_date}</td>
				</tr>
				</c:forEach>
		</tbody>
	</table>
	</div>
	<jsp:include page="../footer.jsp" />
	<script type="text/javascript">
		
	</script>
</body>
</html>
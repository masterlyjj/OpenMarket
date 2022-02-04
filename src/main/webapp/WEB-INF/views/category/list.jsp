<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category List</title>
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
.container {
max-width: 950px;
float: left;
}
</style>
</head>
<body>
	<jsp:include page="../seller/sellerheader.jsp" />
	<jsp:include page="../seller/sellersidebar.jsp" />
	<div class="container" style=" font-size : small;">
	<h4>카테고리 리스트</h4>
	<c:if test="${managerLogin.manager_code > 0}">
	<a class="btn btn-outline-primary btn-sm" style="float: right;" href="/category/insert">카테고리 등록</a>
	</c:if>
	<table class="table">
		<thead>
			<th scope="col">no</th>
			<th scope="col">카테고리명</th>
			<th scope="col">아이템명</th>
			<th></th>
		</thead>
		<tbody>
			<c:forEach items="${pt.list}" var="vo" varStatus="status">
				<tr>
					<th scope="row">${status.count}</th>
					<td>${vo.item_category}</td>
					<td>${vo.item_name}</td>
					<td>
					<c:if test="${managerlogin.manager_code >0}">
						<a class="btn btn-outline-primary btn-sm" href="/category/update/${vo.item_name}">수정</a>
						<a class="btn btn-outline-primary btn-sm category_delete" href="/category/delete/${vo.item_name}">삭제</a>
					</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div style="margin-left: 40%">
		<jsp:include page="page.jsp" />
	</div>
	</div>
	<jsp:include page="../footer.jsp" />
<script type="text/javascript">
	$(document).ready(function(){
		$('.category_delete').click(function() { 
			var result = confirm('삭제 하시겠습니까?'); 
			if(result) { 
				var link = $(this).href;
				location.assign(link);
			} else { 
				event.preventDefault();
			} 
		}); 
	});
</script>
</body>
</html>
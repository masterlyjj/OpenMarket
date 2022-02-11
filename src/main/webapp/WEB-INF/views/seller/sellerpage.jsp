<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <script src="/resources/js/file.js" type="text/javascript"></script>
<title>판매자 페이지</title>
</head>
<body>
	<jsp:include page="sellerheader.jsp" />
	<jsp:include page="sellersidebar.jsp" />
	
	<div class="container container-table">
		<h4>최근 등록한 상품</h4>
		<div class="uploadedList row row-cols-3 row-cols-sm-4 row-cols-md-5 g-3">
		</div>
		<div style="margin-top : 100px; margin-bottom : 0px; margin-left: 40%;">
		</div>
	</div>
	
	<script type="text/javascript">
	$.getJSON("/item/listBySeller2/${login.member_id}",function(data){
		var list= data.list;
		if(list ==''){
			$(".uploadedList").append("<p>등록된 상품이 없습니다.</p>");
		}else{
		for(var i =0; i<list.length;i++){
			var arr = list[i];
				var item_no = arr.item_no;
				var item_name = arr.item_name;
				var file_name = arr.file_name;
				var item = uploadedItemForlist(file_name,item_no,item_name);
				$(".uploadedList").append(item);
				}
		}
	});
</script>
</body>
<jsp:include page="../footer.jsp" />
</html>
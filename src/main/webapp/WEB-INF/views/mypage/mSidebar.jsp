<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="/resources/js/sidebar.js" type="text/javascript"></script>
<style type="text/css">
.sidebar{
width : 200px;
float : left;
}

</style>
<title>마이페이지 사이드바</title>
</head>
<body>
	<div class="container-fluid">
				<div class="sidebar">

					<ul class="nav flex-column mb-2">
						<li class="nav-item"><a class="nav-link text-muted" href="/order/detail/${login.member_id}">
								<span data-feather="file-text"></span> 주문/배송
						</a></li>
						<li class="nav-item"><a class="nav-link text-muted" href="/cart/read/${login.member_id}">
								<span data-feather="file-text"></span> 장바구니
						</a></li>
						<li class="nav-item"><a class="nav-link text-muted" href="/likeitem/list/${login.member_id}">
								<span data-feather="file-text"></span> 좋아요
						</a></li>
						<li class="nav-item"><a class="nav-link text-muted" href="/member/read/${login.member_id}">
								<span data-feather="file-text"></span> 내 정보
						</a></li>
					</ul>

				</div>
		</div>
</body>
</html>
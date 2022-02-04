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
<title>고객센터 사이드바</title>
</head>
<body>
	<div class="container-fluid">
				<div class="sidebar">

					<ul class="nav flex-column mb-2">
						<li class="nav-item"><a class="nav-link text-muted" href="/Myreplies/list/${login.member_id}">
								<span data-feather="file-text"></span> 내 리뷰 목록
						</a></li>
						<li class="nav-item"><a class="nav-link text-muted" href="/qna/listForMember/${login.member_id}">
								<span data-feather="file-text"></span> 내 Q&A 목록
						</a></li>
						<li class="nav-item"><a class="nav-link text-muted" id="btn_resist" href="/member/requestResist/${login.member_id}">
								<span data-feather="file-text"></span> 판매자 등록
						</a></li>
						<li class="nav-item"><a class="nav-link text-muted" href="/member/read/${login.member_id}">
								<span data-feather="file-text"></span> 내 정보
						</a></li>
					</ul>

				</div>
		</div>
</body>
</html>
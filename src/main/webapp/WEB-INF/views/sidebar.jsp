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

<title>사이드바 메뉴</title>
<style type="text/css">
.accordion {
background-color: #eee;
color: #444;
cursor: pointer;
padding: 18px;
width: 100%;
border: none;
text-align: left;
outline: none;
font-size: 15px;
transition: 0.4s;
}

.active, .accordion:hover {
background-color: #ccc;
}

.panel {
padding: 0 18px;
display: none;
background-color: inherit;
overflow: hidden;
}

.sidebar{
width : 200px;
float : left;
}
</style>
</head>
<body>
			<nav id="sidebarMenu" class="sidebar">

					<button class="accordion">영/유아(0세~7세)</button>
					<div class="panel">
					<a href="like/item">모빌</a><br>
					<a href="like/item">딸랑이</a><br>
					<a href="like/item">오뚝이</a><br>
					<a href="like/item">아기체육관</a><br>
					</div>
					<button class="accordion">아동(8세~11세)</button>
					<div class="panel">
					<a href="like/item">역할놀이</a><br>
					<a href="like/item">작동완구</a><br>
					<a href="like/item">주방놀이</a><br>
					<a href="like/item">장난감</a><br>
					</div>
					<button class="accordion">인형</button>
					<div class="panel">
					<a href="like/item">미미월드</a><br>
					<a href="like/item">시크릿쥬쥬</a><br>
					<a href="like/item">콩순이</a><br>
					</div>

					<c:if test="${not empty managerLogin}">
						<h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
							<span>Manager</span> <a
								class="d-flex align-items-center text-muted" href="#"
								aria-label="Add a new report"> <span
								data-feather="plus-circle"></span>
							</a>
						</h6>
						<ul class="nav flex-column mb-2">

							<li class="nav-item"><a class="nav-link text-muted"
								href="/category/list/"> <span data-feather="file-text"></span>
									카테고리
							</a></li>
							<li class="nav-item"><a class="nav-link text-muted"
								href="/item/listofall/"> <span data-feather="file-text"></span>
									아이템
							</a></li>
							<li class="nav-item"><a class="nav-link text-muted"
								href="/order/detailAll/1"> <span data-feather="file-text"></span>
									주문 목록
							</a></li>
							<li class="nav-item"><a class="nav-link text-muted"
								href="/Myreplies/listOfAll"> <span data-feather="file-text"></span>
									리뷰 목록
							</a></li>
							<li class="nav-item"><a class="nav-link text-muted"
								href="/qna/listOfAll"> <span data-feather="file-text"></span>
									QnA 목록
							</a></li>
						</ul>
					</c:if>
			</nav>
	<script type="text/javascript">
		$(document).ready(function() {

			var acc = document.getElementsByClassName("accordion");
			var i;

			for (i = 0; i < acc.length; i++) {
				acc[i].addEventListener("click", function() {
					this.classList.toggle("active");
					var panel = this.nextElementSibling;
					if (panel.style.display === "block") {
						panel.style.display = "none";
					} else {
						panel.style.display = "block";
					}
				});
			}
			$.getJSON("/category/categorylist", function(result) {
				for (var i = 0; i < result.length; i++) {
					var msg = categorylist(result[i].item_category);
					$(".category_list").append(msg)
				}
			});
		});
	</script>
</body>
</html>
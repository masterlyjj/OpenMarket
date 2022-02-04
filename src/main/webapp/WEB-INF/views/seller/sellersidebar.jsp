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
	<div class="container-fluid">
		<div class="sidebar">
			<ul class="nav flex-column mb-2">
			 <c:choose>
         		<c:when test="${login.member_authcode > 0 }">
						<li class="nav-item"><a class="nav-link text-muted" href="/seller/sellerCheckOrder/${login.member_id}">
								<span data-feather="file-text"></span> 주문정보
						</a></li>
						<li class="nav-item"><a class="nav-link text-muted" href="/item/insert">
								<span data-feather="file-text"></span> 상품등록
						</a></li>
						<li class="nav-item"><a class="nav-link text-muted" href="/item/listBySeller/${login.member_id}">
								<span data-feather="file-text"></span> 상품목록
						</a></li>
						<li class="nav-item"><a class="nav-link text-muted" href="/category/list/"> 
								<span data-feather="file-text"></span> 카테고리
						</a></li>
						<li class="nav-item"><a class="nav-link text-muted" href="/member/read/${login.member_id}">
								<span data-feather="file-text"></span> 내 정보
						</a></li>
				</c:when>
				
				 <c:when test="${managerLogin.manager_code > 0}">
						<li class="nav-item"><a class="nav-link text-muted" href="/category/list/"> 
								<span data-feather="file-text"></span> 카테고리
						</a></li>
						<li class="nav-item"><a class="nav-link text-muted" href="/item/insert">
								<span data-feather="file-text"></span> 상품등록
						</a></li>
						<li class="nav-item"><a class="nav-link text-muted" href="/item/listofall">
								<span data-feather="file-text"></span> 전체상품목록
						</a></li>
						<li class="nav-item"><a class="nav-link text-muted" href="/Myreplies/listOfAll">
								<span data-feather="file-text"></span> 전체리뷰
						</a></li>
						<li class="nav-item"><a class="nav-link text-muted" href="/qna/listOfAll">
								<span data-feather="file-text"></span> 전체Q&A
						</a></li>
				 </c:when>
     		</c:choose>
    	 </ul>

				</div>
		</div>
</body>

							
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
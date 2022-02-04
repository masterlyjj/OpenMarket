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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="/resources/js/fnq.js" type="text/javascript"></script>
<title>Insert title here</title>

<style type="text/css">
table{
table-layout: fixed;
}
.fnq_ctnt {
display : none;
}
.pagingline {
margin-top: 10px;
width : 950px;
}
</style>
</head>
<body>
	<div class="container">
         <table id="contents" class="table" style="width: 100%;">
			<c:if test="${not empty managerLogin && empty login}">
			<a href="/fnq/insertui" class="btn btn-outline-primary btn-sm float-right">글쓰기</a><br>
			</c:if>
                 <h4>F&Q 게시판</h4>
                 <thead>
                 <tr>
	                 <th>번호</th>
	                 <th>제목</th>
	                 <th>작성자</th>
                 </tr>
                 </thead>
                    <tbody>
                    </tbody>
          </table>
		
	</div>

<script type="text/javascript">
$(document).ready(function(){
	
	fnqlist(1,$("tbody"));
	
	$("tbody").on("click", ".fnq_page_left", function(event) {
		event.preventDefault();
		var curPage = $(this).attr("href");

		if (curPage > 1) {

			fnqlist(--curPage, $("tbody"));
		}

	});

	$("tbody").on("click", ".fnq_page_right", function(event) {
		event.preventDefault();
		var curPage = $(this).attr("href");
		var totalPage = $(this).attr("data-totalPage");

		if (curPage < totalPage) {

			fnqlist(++curPage, $("tbody"));
		}

	});

	$("tbody").on("click", ".fnq_page_no", function() {
		var curPage = $(this).text();

		fnqlist(board_no, curPage, $("tbody"));
	});
	
	$("tbody").on("click",".view-ctnt",function() {
        var clkIdx = $(".view-ctnt").index($(this));
        
        if ($(".fnq_ctnt").eq(clkIdx).css("display") == "none") {
           $(".fnq_ctnt").eq(clkIdx).css("display","table-row");
        }else{
           $(".fnq_ctnt").eq(clkIdx).css("display","none");
           }
	});
	
});
</script>
</body>
</html>
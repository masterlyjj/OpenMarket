<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<title>고객센터</title>
<style type="text/css">
.container {
max-width: 750px;
float: left;
}
.cs-contents{
width : 100px;
text-decoration: underline;

}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<jsp:include page="../cs/cSidebar.jsp" />
	
	<div class="container" style="font-size: small;">
		<h4>고객센터</h4>
<!-- 		<div class="cs-contents"> -->
<!-- 			<div class="cs-menus"> -->
<%-- 			<a href="/Myreplies/list/${login.member_id}" class="nav-link px-2 link-dark text-dark"><span>내 리뷰 목록</span></a> --%>
<%-- 			<a href="/qna/listForMember/${login.member_id}" class="nav-link px-2 link-dark text-dark">내 Q&A 목록</a> --%>
<%-- 			<a href="/member/requestResist/${login.member_id}" id="btn_resist" class="nav-link px-2 link-dark text-dark">판매자 등록</a> --%>
<!-- 			</div> -->
<!-- 		</div> -->
		
		<jsp:include page="../fnq/list.jsp" />
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#btn_resist").click(function(event){
			event.preventDefault();
			var member_id = "${login.member_id}";
			var member_authcode = "${login.member_authcode}";
			if(member_authcode == 1){
				alert("이미 등록된 회원입니다.");
				return;
			}
			var resistSeller = confirm("판매자계정으로 등록하시겠습니까?");
			if(resistSeller == 1){
			$.ajax({
				type : "GET",
				url : "/member/requestResist/"+member_id,
				success : function(result){
					alert("등록이 완료되었습니다. 다시 로그인해 주세요.");
					window.location.reload();
				}
			});
			}else{
				alert("등록이 취소되었습니다.");
			}
		});
	});
	</script>
</body>
	<jsp:include page="../footer.jsp" />
</html>
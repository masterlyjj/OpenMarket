<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="/resources/js/board.js" type="text/javascript"></script>
<style type="text/css">
  .star {
    position: relative;
    font-size: 2rem;
    color: #ddd;
  }
  
  .star input {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    opacity: 0;
    cursor: pointer;
  }
  
  .empty_star {
    width: 0;
    position: absolute; 
    left: 0;
    color: yellow;
    overflow: hidden;
    pointer-events: none;
  }
</style>
</head>
<body>

	<div class="modal-dialog" id="reviewContainer">
		<input type="hidden" name="board_no" value="${board_no}">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<span>리뷰작성</span>
				</h5>
			</div>

			<div class="modal-body">

				<div class="form-group">
					작성자<input class="form-control" name="member_id" id="member_id"
						value="${login.member_id }" readonly>
				</div>
				만족도
				<span class="star">★★★★★<span class="empty_star">★★★★★</span>
				  <input type="range" oninput="range(this)" name="review_grade" value="1" step="1" min="0" max="5">
				</span>

				<div class="form-group">

					리뷰
					<textarea class="form-control" name="review_content"
						id="review_content" rows="5" maxlength="33"></textarea>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal"
					id="btn_review_input">리뷰완료</button>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var board_no = ${board_no};
		function range(target){
			$(".empty_star").css("width",""+(target.value)*20+"%");
		 }
		$(document).ready(function() {
			$("#btn_review_input").click(function() {
				var member_id = $("#member_id").val();
				var review_content = $("#review_content").val();
				var review_grade = $("input[name='review_grade']").val();

				if (member_id == '') {
					$("#member_id").focus();
					return;
				}

				if (review_content == '') {
					$("#review_content").focus();
					return;
				}

				if (review_grade == '') {
					$(".starpoint_box").focus();
					return;
				}

				$.ajax({
					type : "post",
					url : "/replies",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : "text",
					data : JSON.stringify({
						board_no : board_no,
						member_id : member_id,
						review_content : review_content,
						review_grade : review_grade
					}),
					success : function(result) {
						if (result == "SUCCESS") {
							$("#member_id").val("");
							$("#review_content").val("");
							$("#review_grade").val("");
							$("#reviewContainer").hide();

							getAllReplies(board_no, $("#replies"));

							opener.parent.location.reload();
							window.close()
							//팝업창 닫기 및 부모창 새로고침
						}

					}
				});

			});

		});
	</script>
</body>
</html>
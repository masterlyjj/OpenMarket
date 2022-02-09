<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>장바구니</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="/resources/js/file.js" type="text/javascript"></script>
<style type="text/css">
table .foot {
	border-style: 30px;
}

img {
	width: 100px;
	height: 100px;
}

.container {
max-width: 750px;
float: left;
}
</style>
</head>
<body class="cart_body">
	<jsp:include page="../header.jsp" />
	<jsp:include page="../mypage/mSidebar.jsp" />

	<div class="container" id="frame">
	<h4>장바구니 목록</h4>
		<form action="">
			
				<table class="table">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">상품 이미지</th>
							<th scope="col"><span>상품명</span></th>
							<th scope="col">할인가(판매가)</th>
							<th scope="col">수량/재고</th>
							<th scope="col">합계</th>
							<th scope="col">선택</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${map.list}" var="cart" varStatus="i">
							<c:set var="isTrue" value="true" />
							<tr>
								<td>${i.count}</td>
								<td><div data-item_no="${cart.item_no}"
										data-item_name="${cart.item_name}"
										data-file_name="${cart.file_name}"
										class="uploadedList${i.index}"></div></td>
								<td><a style="text-decoration: none; color: #000;" href="/item/read/${cart.item_no}">${cart.item_name}</a></td>
								<td><span class="dprice">${(100-cart.discount_percentage)*cart.item_price/100}</span>(${cart.item_price})
									원</td>
								<td><input class="ino${i.index}" style="width:30px;" name="cart_quantity" type="number"
									data-itemno="${cart.item_no}" data-ea="" min="1" max="99" step="1"
									value="${cart.cart_quantity}"></td>
								<td><span class="isum">${((100-cart.discount_percentage)*cart.item_price/100)*cart.cart_quantity}</span></td>
								<td><button data-citem_no="${cart.cart_no}"
										class="btn btn-outline-info btn-sm del">삭제</button> <br></td>
							</tr>
						</c:forEach>
						<c:set var="isTrue" value="false" />
					</tbody>
				</table>
				<div
					style="font-size: 15pt; font-weight: bold; width: 30%; margin-left: 70%;">
					<span class="totalprice">결제금액
						:&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;</span><span>원</span>
				</div>
		</form>
		<div style="margin-left: 80%; margin-top: 5%">
			<button class=" btn btn-outline-success btn-lg order">주문하기</button>
		</div>
		<div style="margin-left: 40%">
			<jsp:include page="page.jsp"></jsp:include>
		</div>
	</div>

	<jsp:include page="../footer.jsp" />

	<script type="text/javascript">
	$(document).ready(function(){
		
	
		var vo = "${map.list}";
		vo = eval(vo);
		for (var i = 0; i < vo.length; i++) {
			var div_class = ".uploadedList" + i;
			var item_no = $(div_class).attr("data-item_no");
			var file_name = $(div_class).attr("data-file_name");
			var item = uploadedItemlist(file_name, item_no);
			$(div_class).append(item);
			
			$.getJSON("/item/getQuantity/"+item_no, function(data){
				for(var j = 0; j < data.length;j++){
				var arr =data[j];
				$("input[data-itemno='"+arr.item_no+"']").attr("data-ea",arr.item_amount);
				$("input[data-itemno='"+arr.item_no+"']").attr("data-item_no",arr.item_no);
			var item_no = $("input[data-itemno='"+arr.item_no+"']").attr("data-item_no");
			var item_ea = $("input[data-itemno='"+arr.item_no+"']").attr("data-ea");
			
			if(item_ea <0){
				$("input[data-ea='"+item_ea+"']").unwrap().wrap("<td><p class='status-quantity'>품절</p></td>");
				$("input[data-ea='"+item_ea+"']").remove();
			}
				}
			});
		}
		

		var map = "${map}";
		var list = "${map.list}";
		var member_id = "${member_id}";
		
		var money = "${map.sumMoney}";
		var sumMoney = eval(money);
		$(".totalprice").append(sumMoney);

		var ilist = "${map.ilist}";
		var iarr = eval(ilist);

		var sum = 0;
		

		$("#totalprice").text(sum);
		

		$("input[name='cart_quantity']").on("input", function(event) {
					var qtag = $(this);
					var update_quantity = $(this).val();
					var totalprice = $(this).val();
					var item_no = $(this).attr("data-itemno");
					$.getJSON("/item/getQuantity/"+item_no, function(data){
						var item_ea = $("input[data-itemno='"+item_no+"']").attr("data-ea");
							if (update_quantity > item_ea) {
								alert("재고수량을 초과했습니다.");
								qtag.val(item_ea);
								update_quantity = item_ea;
							}
					})
					$.ajax({
						type : "post",
						url : "/cart/updateQuantity",
						data : {
							member_id : member_id,
							item_no : item_no,
							cart_quantity : update_quantity
						},
						dataType : "text",
						success : function(data) {
							var dprice = $(qtag).parent().prev("td").children(
									"span.dprice").text();
							$(qtag).parent().next("td").children("span").text(
									eval(dprice * update_quantity));
							var arr = $(".isum");
							var sum = 0;
							for (var i = 0; i < arr.length; i++) {
								sum = sum + eval($(arr[i]).text());
							}
							$(".totalprice").text(sum);
						}
					});
				});

		$(".del").click(function(event) {
			event.preventDefault();
			var delbtn = $(this);
			var cart_no = $(this).attr("data-citem_no");
			$.ajax({
				type : "post",
				url : "/cart/delete",
				data : {
					cart_no : cart_no
				},
				dataType : "text",
				success : function(data) {
					$(delbtn).parent().parent().remove();
					var arr = $(".isum");
					var sum = 0;
					for (var i = 0; i < arr.length; i++) {
						sum = sum + eval($(arr[i]).text());
					}
					$(".totalprice").text(sum);
					window.location.reload();
				}
			});
		});

		$(".order").click(function(event) {
			event.preventDefault();
			var status = $(".status-quantity").text();
			if(status=='품절'){
				alert("품절 된 상품이 있습니다.");
				return;
			}
			if (money == 0) {
				alert("장바구니가 비었습니다.");
			} else {
				location.assign("/order/insert/" + member_id);
			}

		});
	});
	</script>

</body>
</html>
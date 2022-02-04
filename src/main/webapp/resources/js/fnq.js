/**
 * 
 */

function fnqlist(curPage, el) {
	el.html("");

	$.getJSON("/fnq/list/"+curPage, function(data) {
		var arr = data["list"];
		if(arr == null){return;}
		for (var i = 0; i < arr.length; i++) {
			var obj = arr[i];
			
			msg = fnqform(obj["fnq_no"],obj["fnq_title"],obj["manager_id"]);
			msg2 = fnqform2(obj["fnq_no"],curPage,obj["fnq_title"],obj["fnq_content"]);
			
			el.append(msg);
			el.append(msg2);
		}
		var strPage = `
		<div class="pagingline">
			<nav aria-label="Page navigation example">
  				<ul class="pagination justify-content-center">
    				<li class="page-item">
    				  <a class="page-link fnq_page_left" href="${data['curPage']}" aria-label="Previous">
      				 	 <span aria-hidden="true" class="text-secondary">Previous</span>
 				   	  </a>
   					 </li>
		
		`;
		
		for(var i = data.beginPageNum; i < data.endPageNum+1; i++){
			var activeOr = data.curPage == i?"active":"";
			strPage += `<li class="page-item ${activeOr}"><a class="page-link fnq_page_no" href="#">${i}</a></li>`;
		}
		
		strPage +=`
		  <li class="page-item">
      				<a class="page-link fnq_page_right" href="${data['curPage']}" data-totalPage="${data['totalPage']}" aria-label="Next">
      			  <span aria-hidden="true" class="text-secondary">Next</span>
     		 </a>
   		 </li>
  		</ul>
	</nav>
</div>
		`;
		
			el.append(strPage);
		
	});
}

function fnqform(fnq_no, fnq_title, manager_id) {
	var msg = `
					<tr>
						<div>
							<td>${fnq_no}</td>
							<td class="view-ctnt"><a href="javascript:void(0)">${fnq_title}</a></td>
							<td>${manager_id}</td>
						</div>
					</tr>
				`;
	return msg;
}
function fnqform2(fnq_no, curPage, fnq_title, fnq_content){
	var ctnt = `
					<tr class="fnq_ctnt">
						<div>
							<td colspan="3">
							질문: <a href="/fnq/read/${fnq_no}/${curPage}">${fnq_title}</a><br><br>
                           	답변: ${fnq_content}
							</td>
						</div>	
					</tr>
				`;	
	return ctnt;
}

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <main id="main">
    
    

    
    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="row gy-4">
		 <h2>장바구니</h2>
          <div class="col-lg-8">
            <div>
              <div id="cartwrap">
               <div class="tit-box" id="cartInfo">
               	<h5>상품정보</h5>
               </div>
                <!--div class="card">
				  <img src="/assets/thumbnailImg/G13.jpg" alt="" width="200" height="200">
                  <div class="card-body">
                    <table style="width:100%; height:100%">
                    	<colgroup>
            				<col style="width: 50%">
            				<col style="width: 20%">
            				<col style="width: 20%">
            				<col style="width: 10%">
        		  		</colgroup>
        		  		<thead>
            				<tr>
                	  			<th style="text-align: center;">상품정보</th>
                	  			<th style="text-align: center;">수량</th>
                	  			<th style="text-align: center;">상품가격</th>
                	  			<th style="text-align: center;"></th>
            				</tr>
        		  		</thead>
        		  		<tbody id="tbody" style="text-align: center;">
        		  		
        		  		</tbody>
                    </table>
                  </div>
                </div-->
              </div>
            </div>
          </div>
		  <div class="col-lg-2">
		  </div>
          <div class="col-lg-2">
            <div id="content" class="portfolio-description">
              <button type="button" onclick="order();" >주문하기</button>
            </div>
            <form id="cartform">
            <div class="count-wrap _count" >
    			
			</div>
			</form>
          </div>
        </div>
        
      </div>
    </section><!-- End Portfolio Details Section -->

  </main><!-- End #main -->
<style>
.card {
	width:900px;
	height:200px;
    margin-bottom: 30px;
    border: none;
    border-radius: 5px;
    box-shadow: 0px 0 10px rgba(1, 41, 112, 0.6);
    display:flex;
    flex-direction:row;
}
</style>
  <form id="hiddenform">
  	<input type='hidden' id='goodsCd' name='goodsCd' value='${vo.goodsCd}'>
  	<input type='hidden' id='userId' name='userId'>
  </form>
<script>

	// 주문하기
	function order(){
		location.href="/order/order";
	}
	// 카트 불러오기
	$(function(){
		call_server(hiddenform, "/cart/getCartList", getCartList);
	});
	var cartCnt = 0;
	function getCartList(list){
		for(var i = 0; i < list.length; i++){
			var str = "<div class=\"card\">"; 
			str += "<img src=\"/assets/thumbnailImg/"+list[i].goodsCd+".jpg\" alt=\"\" width=\"200\" height=\"200\">";
			str += "<div class=\"card-body\" width=\"700\">";
			str += "<table style=\"width:100%; height:100%\">";
			str += "<colgroup>";
			str += "<col style=\"width: 50%\">";
			str += "<col style=\"width: 20%\">";
			str += "<col style=\"width: 20%\">";
			str += "<col style=\"width: 10%\">";
			str += "</colgroup>";
			str += "<thead>";
			str += "<tr>";
			str += "<th style=\"text-align: center;\">상품정보</th>";
			str += "<th style=\"text-align: center;\">수량</th>";
			str += "<th style=\"text-align: center;\">상품가격</th>";
			str += "<th style=\"text-align: center;\"></th>";
			str += "</tr>";
			str += "</thead>";
			str += "<tbody id=\"tbody"+cartCnt+"\" style=\"text-align: center;\">";
			str += "</tbody>";
			str += "</table>";
			str += "</div>";
			str += "</div>";
			$('#cartInfo').append(str);
			var str = "<tr>";
			str += "<td>"+list[i].goodsName+"</td>";
			str += "<td>"+list[i].buyQty+"</td>";
			str += "<td>"+list[i].sellPrice+"</td>";
			str += "<td><button type=\"button\"onclick = \"deleteLine(this,'"+list[i].goodsCd+"');\">삭제</button></td>"
			str += "</tr>";
			$('#tbody'+cartCnt).append(str);
			cartCnt++;
		}
		/*
		$('#tbody').empty();
		for(var i = 0; i < list.length; i++){
			var str = "<tr>";
			str += "<td>"+list[i].goodsName+"</td>";
			str += "<td>"+list[i].buyQty+"</td>";
			str += "<td>"+list[i].sellPrice+"</td>";
			str += "<td><button type=\"button\"onclick = \"deleteLine(this,'"+list[i].goodsCd+"');\">삭제</button></td>"
			str += "</tr>";
			$('#tbody').append(str);
		}
		*/
	}
	
	// 해당 상품 장바구니에서 삭제하기
	function deleteLine(obj, cd) {
		$('#goodsCd').val(cd);
		$(obj).closest('.card').remove();
		call_server(hiddenform, "/cart/deleteCartList", deleteCartList);
	}
	function deleteCartList(cnt){
		if(cnt>0){
			alert("상품 삭제");
		}else{
			alert("상품을 삭제할 수 없습니다.");
		}
	}
</script>
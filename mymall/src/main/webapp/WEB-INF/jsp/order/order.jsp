<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <main id="main">
    
    

    
    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">
		<form id="orderform">
        <div class="row gy-4">
		 <h2>주문하기</h2>
          <div class="col-lg-8">
            <div>
              <div id="cartwrap">
               <div class="tit-box" id="cartInfo">
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
            </div>
            <div >
			</div>
          </div>
        </div>
        <div>
        	<h4>주문자 정보</h4>
        	<table id="userInfo">
        	  <tr>
        	  	<th>성명 : </th>
        	  	 <td><input type="text" style = 'text-align: left;' id="userName" name="userName"></td>
        	  </tr>
        	  <tr>
        	  	<th>연락처 : </th>
        	  	 <td><input type="text" style = 'text-align: left;' id="phone" name="phone"></td>
        	  </tr>
        	  <tr>
        	  	<th>주소 : </th>
        	  	 <td><input type="text" style = 'text-align: left;' id="addr" name="addr"></td>
        	  </tr>
        	</table>
        	<h4>수취인 정보  <input type="checkbox" id="check" name="check"><label for="check">주문자와 동일</label></h4>
        	<table id="receiveInfo">
        	  <tr>
        	  	<th>성명 : </th>
        	  	 <td><input type="text" style = 'text-align: left;' id="receiveName" name="receiveName"></td>
        	  </tr>
        	  <tr>
        	  	<th>연락처 : </th>
        	  	 <td><input type="text" style = 'text-align: left;' id="receivePhone" name="receivePhone"></td>
        	  </tr>
        	  <tr>
        	  	<th>주소 : </th>
        	  	 <td><input type="text" style = 'text-align: left;' id="receiveAddr" name="receiveAddr"></td>
        	  </tr>
        	</table>
        </div>
        <div>
        	<h4>결제정보</h4>
        	<table id="receiveInfo">
        	  <tr>
        	  	<th>결제수단</th>
        	  	 <td>
        	  	 	<input type="radio" id="online" name="payment" value="온라인입금">
        			<label for="online">온라인입금</label>
        			<input type="radio" id="card" name="payment" value="카드결제">
        			<label for="card">카드결제</label>
        			<input type="radio" id="kakaoPay" name="payment" value="카카오페이">
        			<label for="kakaoPay">카카오페이</label>
        	  	 </td>
        	  </tr>
        	  <tr>
        	  	<th>결제금액 : </th>
        	  	 <td><input type="text" style = 'text-align: left;' id="totalPrice" name="totalPrice" readonly></td>
        	  </tr>
        	</table>
        	<button type="button" onclick="pay();" >결제하기</button>
        </div>
       </form>
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
#userInfo{
	margin-bottom: 30px;
}
#receiveInfo{
	margin-bottom: 30px;
}
#addr {
	width: 500px;
}
#receiveAddr {
	width: 500px;
}
label {
	font-size: 16px;
}
</style>
  <form id="hiddenform">
  	<input type='hidden' id='goodsCd' name='goodsCd' value='${vo.goodsCd}'>
  	<input type='hidden' id='userId' name='userId'>
  </form>
<script>
	// 결제하기
	function pay(){
		call_server(orderform, "/order/ordering", ordering);
	}
	function ordering(cnt){
		if(cnt>0){
			alert("결제완료");
			location.href="/";
		}else{
			alert("결제실패");
		}
	}
	// 체크박스 이벤트
	$("input[name=check]").click(function(){
		if ($(this).is(":checked")) {
	        // 체크
	        $('#receiveName').val($('#userName').val());
	        $('#receivePhone').val($('#phone').val());
	        $('#receiveAddr').val($('#addr').val());
	    } else {
	    	// 체크해제
	        $('#receiveName').val('');
	        $('#receivePhone').val('');
	        $('#receiveAddr').val('');
	    }
	})
	// 주문정보 불러오기
	$(function(){
		call_server(hiddenform, "/cart/getCartList", getCartList);
		call_server(hiddenform, "/order/getOrderInfo", getOrderInfo);
	});
	function getOrderInfo(vo, list){
		$('#userName').val(vo.userName);
		$('#phone').val(vo.phone);
		$('#addr').val(vo.addr);
	}
	var cartCnt = 0;
	var price = 0;
	function getCartList(list){
		for(var i = 0; i < list.length; i++){
			var str = "<div class=\"card\">"; 
			str += "<img src=\"/assets/thumbnailImg/"+list[i].goodsCd+".jpg\" alt=\"\" width=\"200\" height=\"200\">";
			str += "<div class=\"card-body\" width=\"700\">";
			str += "<table style=\"width:100%; height:100%\">";
			str += "<colgroup>";
			str += "<col style=\"width: 50%\">";
			str += "<col style=\"width: 25%\">";
			str += "<col style=\"width: 25%\">";
			str += "</colgroup>";
			str += "<thead>";
			str += "<tr>";
			str += "<th style=\"text-align: center;\">상품정보</th>";
			str += "<th style=\"text-align: center;\">수량</th>";
			str += "<th style=\"text-align: center;\">상품가격</th>";
			str += "</tr>";
			str += "</thead>";
			str += "<tbody id=\"tbody"+cartCnt+"\" style=\"text-align: center;\">";
			str += "</tbody>";
			str += "</table>";
			str += "</div>";
			str += "</div>";
			$('#cartInfo').append(str);
			var str = "<tr>";
			str += "<td name="+list[i].goodsCd+">"+list[i].goodsName+"</td>";
			str += "<td name="+list[i].buyQty+">"+list[i].buyQty+"</td>";
			str += "<td name="+list[i].sellPrice+">"+list[i].sellPrice+"</td>";
			str += "</tr>";
			$('#tbody'+cartCnt).append(str);
			cartCnt++;
			price += list[i].totalPrice;
		}
		$('#totalPrice').val(price);
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
	
</script>
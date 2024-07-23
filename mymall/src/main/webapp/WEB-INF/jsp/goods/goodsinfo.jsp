<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <main id="main">
    
    

    
    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-8">
            <div class="portfolio-details-slider swiper">
              <div id="goodsImage" class="swiper-wrapper align-items-center">
                
              </div>
              
              <div class="swiper-pagination"></div>
            </div>
          </div>

          <div class="col-lg-4">
            <div id="goodsInfo" class="portfolio-info">

            </div>
            <div id="content" class="portfolio-description">
              <h2>상품설명</h2>
            </div>
            <form id="cartform">
            <input type='hidden' name='goodsCd' value='${vo.goodsCd}'>
            <div class="count-wrap _count" >
    			<button type="button" class="minus">-</button>
   				<input type="text" class="inp" value="1" style="text-align: center;" id="buyQty" name="buyQty"/>
    			<button type="button" class="plus">+</button>
    			<button type="button" onclick="cart();" >담기<img src="/assets/img/cartimage.png" alt="Button Image"style="width: 30px; height: 30px;">
    			</button>
			</div>
			</form>
          </div>
        </div>
        
		<div class="row gy-4">
			<div class="col-lg-6">
			</div>
			<!-- 후기 탭 -->
			<ul class="nav nav-tabs">
			  <li class="nav-item">
			    <a class="nav-link active" data-toggle="tab" href="#review">후기</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-toggle="tab" href="#Q&A">Q&A</a>
			  </li>
			</ul>
			<div id="reviewImg">
			<img src="/assets/img/reviewImg.jpg" alt="">
			</div>
			<div id="review" class="tab-pane fade show active">
			  <div>
				<p>등록된 후기가 없습니다.</p>
				<h3>후기를 작성해보세요!</h3>
			  </div>
			</div>
			<!--div>
				<table border="3" style="width: 100%;">
    			  <colgroup>
            			<col style="width: 10%">
            			<col style="width: 60%">
            			<col style="width: 15%">
            			<col style="width: 15%">
        		  </colgroup>
        		  <thead>
            		<tr>
                	  <th style="text-align: center;">No</th>
                	  <th style="text-align: center;">제목</th>
                	  <th style="text-align: center;">회원명</th>
                	  <th style="text-align: center;">등록일</th>
            		</tr>
        		  </thead>
    			</table>
			</div-->
			<!--div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div-->
			
			
			
			<!-- Q&A 탭 -->
			<ul class="nav nav-tabs">
			  <li class="nav-item">
			    <a class="nav-link" data-toggle="tab" href="#review">후기</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link active" data-toggle="tab" href="#Q&A">Q&A</a>
			  </li>
			</ul>
			<div id="Q&A" class="tab-pane fade show active" style="width: 100%;">
    			<table border="3" style="width: 100%;">
    			  <colgroup>
            			<col style="width: 10%">
            			<col style="width: 60%">
            			<col style="width: 15%">
            			<col style="width: 15%">
        		  </colgroup>
        		  <thead>
            		<tr>
                	  <th style="text-align: center;">No</th>
                	  <th style="text-align: center;">제목</th>
                	  <th style="text-align: center;">회원명</th>
                	  <th style="text-align: center;">등록일</th>
            		</tr>
        		  </thead>
        		  <tbody id="tbody">
        		  </tbody>
    			</table>
			</div>
		</div>
      </div>
    </section><!-- End Portfolio Details Section -->

  </main><!-- End #main -->
  <style>
.swiper-wrapper align-items-center {
    text-align:center;
    display:table;
    border:1px solid #cecece;
    width:856px;
    height:800px;
}

.swiper-slide {
    display:table-cell;
    vertical-align:middle;
}

.swiper-img {
    max-width:840px;
    max-height:800px;
}
#review {
	display: flex;
    justify-content: center; /* 수평 가운데 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
    height: 400px; /* 부모 요소의 높이를 차지하도록 설정 */
    width: 100%;
    
}
#reviewImg{
	text-align:center;
}
</style>
  <form id="hiddenform">
  	<input type='hidden' id='goodsCd' name='goodsCd' value='${vo.goodsCd}'>
  </form>
<script>
	// 상품 상세정보
	$(function(){
		call_server(hiddenform, "/goods/getGoodsDetail", getGoodsDetail);
	});
	function getGoodsDetail(vo){
		// 상품 이미지 리스트
		list1 = vo.imglist;
		for (var i = 0; i < list1.length; i++){
			var str = "<div class=\"swiper-slide\">";
			str += "<img src=\"/assets/goodsImg/"+list1[i].imgUrl+".jpg\" alt=\"\" class=\"swiper-img\">";
			str += "</div>";
			$('#goodsImage').append(str);
		}
		// 상품정보
		var str = "<h3>"+vo.goodsName+"</h3>";
		str += "<ul>";
		str += "<li><strong>제조국</strong>: 한국</li>";
		str += "<li><strong>정가</strong>: "+vo.normalPrice+"</li>";
		str += "<li><strong>판매가</strong>: "+vo.sellPrice+"</li>";
		str += "</ul>";
		$("#goodsInfo").append(str);
		$("#content").append("<p>"+vo.content+"</p>");
        
		// 상품문의리스트
		list2 = vo.boardlist;
		$('#tbody').empty();
		for(var i = 0; i < list2.length; i++){
			str = "<tr>";
			str +="<th scope=\"row\" style=\"text-align: center;\">"+(i+1)+"</th>";
			str += "<td onclick=\"boardDetail('"+list2[i].goodsCd+"','"+list2[i].boardNo+"');\" style=\"cursor:pointer; \">"+list2[i].title+"</td>";
			str += "<td style=\"text-align: center;\">"+list2[i].userName+"</td>";
			str += "<td style=\"text-align: center;\">"+list2[i].regDt+"</td>";
			str += "</tr>";
			$('#tbody').append(str);
		}
	}
	$('._count .plus, ._count .minus').on({
	    'click': function(e){
	        e.preventDefault();
	        var $count = $(this).parent('._count').find('.inp');
	        var now = parseInt($count.val());
	        var min = 1;
	        var max = 999;
	        var num = now;

	        if($(this).hasClass('minus')){
	            if(now > min){
	                num = now - 1;
	            }
	        } else {
	            if(now < max){
	                num = now + 1;
	            }
	        }

	        if(num != now){
	            $count.val(num);
	        }
	    }
	});
	function cart(){
		//alert($('#buyQty').val());
		call_server(cartform, "/goods/putInCart", putInCart)
	}
	function putInCart(cnt){
		if(cnt>0){
			alert("장바구니에 상품이 담겼습니다");
		}else{
			alert("장바구니에 상품을 담을 수 없습니다.");
		}
	}
</script>
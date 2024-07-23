<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section id="hero">
    <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

      <div class="carousel-inner" role="listbox">

        <!-- Slide 1 -->
        <div class="carousel-item active" style="background-image: url(assets/img/backimg1.jpg);">
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item" style="background-image: url(assets/img/backimg2.jpg);">
          <div class="carousel-container">
          </div>
        </div>

        <!-- Slide 3 -->
        <div class="carousel-item" style="background-image: url(assets/img/backimg3.jpg);">
          <div class="carousel-container">
          </div>
        </div>

      </div>

      <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
        <span class="carousel-control-prev-icon bx bx-left-arrow" aria-hidden="true"></span>
      </a>

      <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
        <span class="carousel-control-next-icon bx bx-right-arrow" aria-hidden="true"></span>
      </a>

      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

    </div>
  </section><!-- End Hero -->
    
<main id="main">

<form id="hiddenform">
  		<input type='hidden' id='goodsCd' name='goodsCd'>
</form>
    <!-- ======= Portfolio Section ======= -->
    <section id="hotItem" class="portfolio">
      <div class="container">

        <div class="section-title" data-aos="fade-up">
          <h2> <strong>HOT ITEMS</strong></h2>
        </div>

        <div id="portfolio-container" class="row" data-aos="fade-up" style='cursor:pointer;'>
        </div>

      </div>
    </section>
    
    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio">
      <div class="container">

        <div class="row" data-aos="fade-up">
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="portfolio-flters">

            </ul>
          </div>
        </div>

        <div id="filter-container" class="row portfolio-container" data-aos="fade-up">
        </div>

      </div>
    </section><!-- End Portfolio Section -->

    

  </main><!-- End #main -->
 
 
  <script>
	// 제품 상세보기
  	function goodsView(cd){
  		location.href="/goods/view?goodsCd="+cd;
  	}
  	
  	$(function(){
		call_server(hiddenform, "/main/getGoodsImage", getGoodsImage);
		call_server(hiddenform, "/main/getCtLv1", getCtLv1);
	});
  	// HOT ITEM 12개 불러오기
  	function getGoodsImage(list){
  		$('#portfolio-container').empty();
  		$('#filter-container').empty();
		for(var i = 0; i < list.length; i++){
			var str = "<div class=\"col-lg-3 col-md-6 portfolio-item filter-"+list[i].ctCd+"\" onclick=\"goodsView('"+list[i].goodsCd+"')\">";
			str += "<img src=\"/assets/thumbnailImg/"+list[i].goodsCd+".jpg\" class=\"img-fluid\" alt=\"\">";
			str += "<div>";
			str += "<h6>"+list[i].goodsName+"</h6>";
			str += "<p>"+list[i].sellPrice+"원"+"</p>";
			str += "</div>";
			str += "</div>";
			$('#portfolio-container').append(str);
		}
		
		for(var i = 0; i < 9; i++){
		var str = "<div class=\"col-lg-4 col-md-6 portfolio-item filter-"+list[i].ctCd+"\">";
			str += "<img src=\"/assets/thumbnailImg/"+list[i].goodsCd+".jpg\" class=\"img-fluid\" alt=\"\">";
			str += "<div class=\"portfolio-info\">";
			str += "<h4>"+list[i].goodsName+"</h4>";
			str += "<p>"+list[i].sellPrice+"원"+"</p>";
		  	str += "<a href=\"/assets/thumbnailImg/"+list[i].goodsCd+".jpg\" data-gallery=\"portfolioGallery\" class=\"portfolio-lightbox preview-link\"title='"+list[i].goodsName+"'><i class=\"bx bx-plus\"></i></a>";
			str += "<a href=\"portfolio-details.html\"+ class=\"details-link\" title=\"More Details\"><i class=\"bx bx-link\"></i></a>";
			str += "</div>";
			str += "</div>";
			$('#filter-container').append(str);
		}
		
  	}
  	
  	
  	// 카테고리 대분류 불러오기
  	function getCtLv1(list){
  		$('#portfolio-flters').empty();
  		var str = "<li data-filter=\"*\" class=\"filter-active\">전체</li>";
  		for(var i = 0; i < list.length; i++){
			str += "<li data-filter=\".filter-"+list[i].ctCd+"\">"+list[i].ctName+"</li>";
		}
  		$('#portfolio-flters').append(str);
  	}
  </script>

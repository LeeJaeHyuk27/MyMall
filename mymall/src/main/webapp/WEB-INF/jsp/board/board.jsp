<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <main id="main">
    
    

    
    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">      
		<div class="row gy-4">
		  <h2>문의사항</h2>
			<div class="col-lg-6">
			</div>
			<div id="Q&A" class="tab-pane fade show active" style="width: 100%;">
    			<table border="3" style="width: 100%;" class="boardClass">
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
    			<button type="button" onclick="board();">문의하기</button>
			</div>
		</div>
      </div>
      <div class="modal fade" id="boardModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
             <div class="modal-header">
                <h5 class="modal-title">문의사항</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             </div>
             <div class="modal-body">
               <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">제목</th>
                    <td scope="col" id="title"></td>
                  </tr>
                  <tr>
                    <th scope="col">회원명</th>
                    <td scope="col" id="userName"></td>
                  </tr>
                  <tr>
                    <th scope="col">작성일</th>
                    <td scope="col" id="regDt"></td>
                  </tr>
                  <tr>
                    <th scope="col">문의내용</th>
                    <td scope="col" id="content"></td>
                  </tr>       
                </thead>
              </table>
             </div>
             <div class="modal-footer">
               <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
             </div>
          </div>
        </div>
      </div>
      <div class="modal fade" id="pwdCheck" tabindex="-1">
        <div class="modal-dialog">
           <div class="modal-content">
              <div class="modal-header">
                 <h5 class="modal-title">비밀번호 입력</h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form id="hiddenform">
                 <input type='hidden' id='boardSeq' name='boardSeq'>
			  	  <table>
			  	    <tr>
			  	  	  <td>비밀번호 : <input type="password" id="secretPwd" name="secretPwd"></td>
			  	    </tr>
			  	  </table>
			  	</form>
              </div>
              <div class="modal-footer">
              	<button type="button" class="btn btn-primary" onclick="pwdCheck();">확인</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
              </div>
           </div>
        </div>
      </div>
      <div class="modal fade" id="boardInputModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
             <div class="modal-header">
                <h5 class="modal-title">문의사항 작성</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             </div>
             <form id="boardInputform">
             <div class="modal-body">
               <table border='3' class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col">제목</th>
                    <td><input type="text" id="title" name="title"></td>
                    <th scope="col">문의유형</th>
                    <td>
                      <div class="col-sm-2">
                      <select id="boardType" name="boardType" >
   						  <option value=>=== 선택 ===</option>
   						  <option value="상품문의">상품문의</option>
   						  <option value="배송문의">배송문의</option>
   						  <option value="기타문의">기타문의</option>
    				  </select>
    				  </div>
    				</td>
                  </tr>
                  <tr>
                    <th scope="col">첨부파일</th>
                    <td><input type="text" id="attchFile" name="attchFile"></td>
                  </tr>
                  <tr>
                    <th scope="col">문의내용</th>
                    <td><textarea id="content" name="content" rows = "3" cols="50"></textarea></td>
                  </tr>       
                </thead>
              </table>
             </div>
             <div class="modal-footer">
               <div style="float:left; width:100%;" >
                 <input type="checkbox" id="secretYn" name="secretYn"><label for="secretYn">비밀글 설정</label>
                 <input type="text" id="secretPwd1" name="secretPwd">
                 <button style="float:right; margin-left:3px;" type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                 <button style="float:right;" type="button" class="btn btn-primary" onclick="boardInput();">작성</button>
               </div>
             </div>
             </form>
          </div>
        </div>
      </div>
    </section><!-- End Portfolio Details Section -->
	
  </main><!-- End #main -->
  <style>
.lockImg {
    width:20px;
    height:20px;
}
.boardClass{
	margin-bottom:5px;
	
}
.boardClass tr {
	height:40px;
    border-bottom: 1px solid #ccc;
}

</style>

  	
<script>
	// 비밀글 설정
	$("input[name=secretYn]").click(function(){
		if ($(this).is(":checked")) {
	        // 체크
			secretPwd1.disabled = false;
			$(this).val('Y');
	    } else {
	    	// 체크해제
	    	secretPwd1.disabled = true;
	    	$(this).val('N');
	    }
	})

	// 문의사항 불러오기
	$(function(){
		call_server(hiddenform, "/board/getBoardList", getBoardList);
	});
	function getBoardList(list){
		$('#tbody').empty();
		for(var i = 0; i < list.length; i++){
			if(list[i].secretYn == 'Y'){
				str = "<tr>";
				str += "<th scope=\"row\" style=\"text-align: center;\">"+(i+1)+"</th>";
				str += "<td onclick=\"boardDetail('"+list[i].boardSeq+"', '"+list[i].secretYn+"');\" style=\"cursor:pointer; \"><img src=\"/assets/img/lock.png\" alt=\"\" class=\"lockImg\">비밀글입니다.</td>";
				str += "<td></td>"
				str += "<td style=\"text-align: center;\">"+list[i].regDt+"</td>";
			}else{
			str = "<tr>";
			str += "<th scope=\"row\" style=\"text-align: center;\">"+(i+1)+"</th>";
			str += "<td onclick=\"boardDetail('"+list[i].boardSeq+"', '"+list[i].secretYn+"');\" style=\"cursor:pointer; \">"+list[i].title+"</td>";
			str += "<td style=\"text-align: center;\">"+list[i].userName+"</td>";
			str += "<td style=\"text-align: center;\">"+list[i].regDt+"</td>";
			str += "</tr>";
			}
			$('#tbody').append(str);
		}
	}
	// 문의사항 상세보기
	function boardDetail(seq,yn){
		$('#boardSeq').val(seq);
		if(yn == 'N'){
			call_server(hiddenform, "/board/getBoardDetail", getBoardDetail)
		}else{
			$("#secretPwd").val("");
			$('#pwdCheck').modal('show');
		}
	}
	function getBoardDetail(vo){
		$('#title').text(vo.title);
		$('#userName').text(vo.userName);
		$('#regDt').text(vo.regDt);
		$('#content').text(vo.content);
		$('#boardModal').modal('show');
	}
	// 비밀글 확인
	function pwdCheck(){
		call_server(hiddenform, "/board/secretPwdCheck", secretPwdCheck)
	}
	function secretPwdCheck(vo){
		if(vo){
			$('#pwdCheck').modal('hide');
			$('#title').text(vo.title);
			$('#userName').text(vo.userName);
			$('#regDt').text(vo.regDt);
			$('#content').text(vo.content);
			$('#boardModal').modal('show');
		}else{
			alert("비밀번호를 다시 입력해주세요.");
		}
			
	}
	// 문의하기
	function board(){
		$('#boardInputform')[0].reset();
		secretPwd1.disabled = true;
		$('#boardInputModal').modal('show');
	}
	function boardInput(){
		call_server(boardInputform, "/board/insertBoard", insertBoard)
	}
	function insertBoard(cnt){
		if(cnt>0){
			alert("작성완료");
			$('#boardInputModal').modal('hide');
			search();
		}else{
			alert("작성 실패");
		}
	}
</script>
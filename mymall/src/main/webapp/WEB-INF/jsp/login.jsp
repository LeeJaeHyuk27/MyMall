<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>My Shop Login</title>

<!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/assets/css/style.css" rel="stylesheet">

</head>


<body>
	<main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              
              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">MyMall</h5>
                  </div>

                  <form id="loginform" class="row g-3 needs-validation" novalidate>

                    <div class="col-12">
                      <label for="yourUsername" class="form-label">회원 ID</label>
                      <div class="input-group has-validation">
                        <input type="text" id="userId" name="userId" class="form-control" required>
                        <div class="invalid-feedback">아이디를 입력하시오.</div>
                      </div>
                    </div>

                    <div class="col-12">
                      <label for="yourPassword" class="form-label">패스워드</label>
                      <input type="password" id="userPwd" name="userPwd" class="form-control" required>
                      <div class="invalid-feedback">패스워드를 입력하시오.</div>
                    </div>

                    <div class="col-12">
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="remember" id="rememberMe">
                        <label class="form-check-label" for="rememberMe">기억하기</label>
                      </div>
                    </div>
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="button" onclick="login();">Login</button>
                      <button class="btn btn-secondary w-100" type="button" onclick="join();">join</button>
                    </div>
                    
                  </form>

                </div>
              </div>

              <div class="credits">
                <!-- All the links in the footer should remain intact. -->
                <!-- You can delete the links only if you purchased the pro version. -->
                <!-- Licensing information: https://bootstrapmade.com/license/ -->
                <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
                Designed by <b>이젠아카데미</b>
              </div>

            </div>
          </div>
        </div>

      </section>

    </div>
  </main><!-- End #main -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>



  <!-- Template Main JS File -->
  <script src="/assets/js/main.js"></script>
  <script src="/assets/js/jquery-3.7.1.js"></script>
  <script src="/assets/js/common.js"></script>
  <script src="/assets/js/jquery.cookie.js"></script>
  
  <script>
  	// 로그인 확인
    function login(){
    	if($('#userId').val()==''){
    		alert("아이디를 입력하세요");
    		return;
    	}
    	if($('#userPwd').val()==''){
    		alert("패스워드를 입력하세요");
    		return;
    	}
    	call_server(loginform, "/loginProcess", confirmLogin);
    	
     	// 쿠키 설정
        if($('#rememberMe').is(':checked')) {
            $.cookie('userId', $('#userId').val(), { expires: 365, path: '/' });
        } else {
        	$.removeCookie('userId', { path: '/' });
        }
    }
    function confirmLogin(vo){
    	if(vo.result){
    		location.href="/";
    	}else{
    		alert(vo.msg);
    	}
    }
    // 회원가입
    function join(){
    	location.href="/join";
    }
    
    var id=$.cookie('userId');
    if(id!=''){
    	$('#userId').val(id);
    	$('#rememberMe').prop('checked', true);
    }
    
  </script>

</body>
<style>
.btn-primary {
    margin-bottom: 5px;
}
</style>
</html>
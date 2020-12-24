<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>REGISTER</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900">
<link rel="stylesheet" href="../fonts/icomoon/style.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="../css/style.css">

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
 		//중복체크 버튼 눌렀을때 호출되는 함수 
 		
 		function winopen(){
 			//아이디를 입력하지 않았다면?
 			var form = document.fr;
 			if(form.id.value == ""){
 				//아이디를 입력하세요 <--경고메세지창 뛰우기
 				alert("아이디를 입력해 주세요.");
 				//아이디입력<input>태그에  포커스주기
 				form.id.focus();
 				//winopen함수 빠져 나가기
 				return;
 			}
 			//아이디를 입력 했다면?
 				//입력한 아이디값을 얻어  fid변수에 저장
 				var fid	 = form.id.value;
 				//"register_IDCheck.jsp"페이지를 팝업창으로 열어 요청할때? 입력한 아이디를 전송!
 				//이팝업창의 width=400, height=200 으로 설정
 				window.open("register_IDCheck.jsp?userid=" + fid,"","width=300,height=200");	
 		}
 		
 		function checkValue() {
 			var form = document.fr;
 			if(!form.id.value){
 				alert("아이디를 입력해 주세요.");
 				form.id.focus();
 				return false;
 			}
 			if(form.idCheck.value != "idCheck"){
 				alert("아이디 중복체크를 해주세요.");
 				form.searchID.focus();
 				return false;
 			}
 			if(!form.password.value){
 				alert("비밀번호를 입력해 주세요.");
 				form.password.focus();
 				return false;
 			}
 			
 			if(!form.password2.value){
 				alert("확인할 비밀번호를 입력해주세요.");
 				form.password2.focus();
 				return false;
 			}else if(form.password.value != form.password2.value){
 				alert("비밀번호가 일치하지 않습니다.");
 				form.password2.focus();
 				return false;
 			}
 			
 			if(!form.name.value){
 				alert("이름을 입력해 주세요");
 				form.name.focus();
 				return false;
 			}
 			
 			if(!form.email.value){
 				alert("이메일을 입력해 주세요");
 				form.email.focus();
 				return false;
 			}
 			
 			if(!form.mobile2.value){
 				alert("연락처를 입력해 주세요.");
 				form.mobile2.focus();
 				return false;
 			}
 			
 			if(!form.postcode.value){
 				alert("주소를 입력해 주세요");
 				form.searchAddress.focus();
 				return false;
 			}
 			
 			if(!form.address1.value){
 				alert("주소를 입력해 주세요");
 				form.searchAddress.focus();
 				return false;
 			}
		}
 		
		//우편번호 찾기 눌렀을 때 호출되는 함수
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
 		 		
</script>	
 	
</head>	
<body>

	<div class="site-wrap">

		<div class="site-mobile-menu">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>
		<!-- .site-mobile-menu -->

		<div class="site-blocks-cover overlay inner-page"
			style="background-image: url(../images/sofawdog_cut.jpg);">
			<div class="site-navbar-wrap">
				<!-- 최상단 -->
				<div class="site-navbar-top container py-4"
					style="text-align: right">
					<h2 class="mb-0 site-logo">
						<a href="../index.jsp" style="float: left;">작은도서관</a>
					</h2>
				<%
		         						
					String id = (String)session.getAttribute("id");
				
					if(id != null){
				%>
					<h5>
						<a href="../member/logout.jsp">LOGOUT</a>
						<span style="color: #fff;">|</span>
						<a href="../member/myPage.jsp">MYPAGE</a>
					</h5>
				<%		
					} else {
				%>
					<h5>
						<a href="../member/login.jsp">LOGIN</a>
						<span style="color: #fff;">|</span>
						<a href="../member/register.jsp">JOIN</a>
					</h5>
				<%		
					}
				%>	
				</div>
				
				<div class="site-navbar container">
					<nav class="site-navigation text-right" role="navigation">
						<div class="d-inline-block d-lg-none ml-md-0 mr-auto py-3">
							<a href="#" class="site-menu-toggle js-menu-toggle text-white"><span
								class="icon-menu h3"></span></a>
						</div>
						<ul class="site-menu js-clone-nav d-none d-lg-block">
							<li><a href="../index.jsp">도서관 소개</a></li>
							<li><a href="../about.jsp">이용 안내</a></li>
							<li class="has-children"><a href="../board/board.jsp">게시판</a>
								<ul class="dropdown arrow-top">
									<li><a href="#">Menu One</a></li>
									<li><a href="#">Menu Two</a></li>
									<li><a href="#">Menu Three</a></li>
								</ul></li>
							<li class="has-children"><a href="../gallery/gallery.jsp">갤러리</a>
								<ul class="dropdown arrow-top">
									<li><a href="#">Menu One</a></li>
									<li><a href="#">Menu Two</a></li>
									<li><a href="#">Menu Three</a></li>
									<li class="has-children"><a href="#">Sub Menu</a>
										<ul class="dropdown">
											<li><a href="#">Menu One</a></li>
											<li><a href="#">Menu Two</a></li>
											<li><a href="#">Menu Three</a></li>
										</ul></li>
								</ul></li>
							<li><a href="../search/search.jsp">도서검색</a></li>
						</ul>
					</nav>
				</div>
			</div>
			
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md-10">
						<span class="sub-text">our tiny tiny</span>
						<h1>Library</h1>
					</div>
				</div>
			</div>
		</div>
		
			<!-- 본문 -->			
			<div class="site-section bg-light">
				<div class="container rounded" >
					<div class="l-section content_border">
						<div class="page-header">
							<h1 class="rmain">회원가입</h1>
							<form action="registerPro.jsp" method="post" class="board-write" name="fr" onsubmit="return checkValue()">
								<input type="hidden" name="checked_id" value="">						       
						        <div class="l-join">
				                <h2 class="dot-h">정보입력</h2>
				                	<div class="func">
						                <table class="table">
						                    <colgroup>
						                        <col width="20%">
						                        <col width="*">
						                    </colgroup>
						                    <tbody>
						                        <tr>
						                            <th>아이디</th>
						                            <td>
						                            	<div class="input-group mb-3">
						                                <input type="text" name="id" class="form-control text" placeholder="아이디를 입력해 주세요.">
						                                <button type="button" name="searchID" onclick="winopen()" class="btn btn-primary"><span>중복검사</span></button>
						                               	</div>
						                               	<input type="hidden" name="idCheck" value="idUncheck">
						                               <!--  <i class="file-notice-inline">영문과 숫자를 혼합하여 6~12자리를 입력하세요.</i> -->
						                            </td>
						                        </tr>
						                        <tr>
						                            <th>비밀번호</th>
						                            <td>
						                                <div class="passwrod-wrap">
						                                    <input type="password" name="password" class="form-control text" placeholder="비밀번호를 입력해 주세요.">
						                                </div>
						                                <!-- <i class="file-notice-inline">영문과 숫자를 혼합하여 10~20자리를 입력하세요.</i> -->
						                            </td>
						                        </tr>
						                        <tr>
						                            <th>비밀번호 확인</th>
						                            <td>
						                                <div class="passwrod-wrap">
						                                    <input type="password" name="password2" class="form-control text" placeholder="비밀번호를 다시 한 번 입력해 주세요.">
						                                </div>
						                                <!-- <i class="file-notice-inline">영문과 숫자를 혼합하여 10~20자리를 입력하세요.</i> -->
						                            </td>
						                        </tr>
						                        <tr>
						                            <th>이름</th>
						                            <td>
						                                <input type="text" name="name" class="form-control text" placeholder="이름을 입력해 주세요.">
						                            </td>
						                        </tr>
						                        <tr>
						                            <th>E-mail</th>
						                            <td>
						                                <input type="text" name="email" value="" class="form-control text" placeholder="이메일을 입력해 주세요.">
						                            </td>
						                        </tr>
						                        <tr>
						                            <th>연락처</th>
						                            <td>
						                            	<div style="display: flex;">
						                            	<select name="mobile">
						                            		<option selected>010</option>
						                            		<option>011</option>
						                            		<option>017</option>
						                            		<option>019</option>
						                            	</select>
						                                <span><input type="text" name="mobile2" class="form-control text " placeholder="연락처를 입력해 주세요."></span>
						                           		</div>
						                            </td>
						                        </tr>
						                         <tr>
						                            <th>주소</th>
						                            <td>
						                            	<div style="display: flex;">
						                                <input type="text" id="sample6_postcode" name="postcode" class="form-control text text-middle-password" placeholder="우편번호">
														<input type="button" name="searchAddress" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary"><br>
														</div>
														<input type="text" id="sample6_address" name="address1" class="form-control text" placeholder="주소"><br>
														<input type="text" id="sample6_detailAddress" name="address2" class="form-control text text-middle-password" placeholder="상세주소">
														<input type="text" id="sample6_extraAddress" name="address3" class="form-control text text-middle-password" placeholder="참고항목">
						                            </td>
						                        </tr>
						                    </tbody>
						                </table>
							            <button type="button" class="btn btn-r" onclick="history.back()"><span>취소</span></button>
							            <button type="submit" class="btn btn-r"><span>가입</span></button>
								    </div>
							    </div>
							</form>	  
						</div>  
				 	</div>
				</div>
			</div>
			<!-- 본문 끝 -->	
			
		
		<!-- 푸터 -->
		<footer class="site-footer border-top">
			<div class="container">

				<div class="col-lg-4 mb-5 mb-lg-0" style="margin: 0px auto; text-align: center;">

					<div class="mb-5">
						<h3 class="footer-heading mb-2">Subscribe Newsletter</h3>
						<form action="#" method="post">
							<div class="input-group mb-3">
								<input type="text"
									class="form-control border-white text-white bg-transparent"
									placeholder="Enter Email" aria-label="Enter Email"
									aria-describedby="button-addon2">
								<div class="input-group-append">
									<button class="btn btn-primary" type="button" id="button-addon2">Send</button>
								</div>
							</div>
						</form>
					</div>

					<div class="row">
						<div class="col-md-12">
							<h3 class="footer-heading mb-4">Follow Us</h3>

							<div>
								<a href="#" class="pl-0 pr-3"><span class="icon-facebook"></span></a>
								<a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
								<a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
								<a href="#" class="pl-3 pr-3"><span class="icon-linkedin"></span></a>
							</div>
							<div style="margin-top: 10px;">
								<span class="footer-heading">copyright &copy, 2020 All rights reserved</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>

	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../js/jquery-migrate-3.0.1.min.js"></script>
	<script src="../js/jquery-ui.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.stellar.min.js"></script>
	<script src="../js/jquery.countdown.min.js"></script>
	<script src="../js/jquery.magnific-popup.min.js"></script>
	<script src="../js/bootstrap-datepicker.min.js"></script>
	<script src="../js/aos.js"></script>

	<script src="../js/main.js"></script>

</body>
</html>
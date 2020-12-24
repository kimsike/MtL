<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Interior Design &mdash; Colorlib Website Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="css/aos.css">
    <link rel="stylesheet" href="css/style.css">
    
    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
    <!--kakao map API -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bb00e57617aa11f9ded7987506a373ef"></script>
   
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
			style="background-image: url(images/reader1.jpg);">
			<div class="site-navbar-wrap">
				<!-- 최상단 -->
				<div class="site-navbar-top container py-4"
					style="text-align: right">
					<h2 class="mb-0 site-logo">
						<a href="index.jsp" style="float: left;">작은도서관</a>
					</h2>
					<%
		         						
						String id = (String)session.getAttribute("id");
					
						if(id != null){
					%>
						<h5>
							<a href="member/logout.jsp">LOGOUT</a>
							<span style="color: #fff;">|</span>
							<a href="member/myPage.jsp">MYPAGE</a>
						</h5>
					<%		
						} else {
					%>
						<h5>
							<a href="member/login.jsp">LOGIN</a>
							<span style="color: #fff;">|</span>
							<a href="member/register.jsp">JOIN</a>
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
							<li><a href="index.jsp">도서관 소개</a></li>
							<li class="active"><a href="about.jsp">이용 안내</a></li>
							<li class="has-children"><a href="board/board.jsp">게시판</a>
								<ul class="dropdown arrow-top">
									<li><a href="#">Menu One</a></li>
									<li><a href="#">Menu Two</a></li>
									<li><a href="#">Menu Three</a></li>
								</ul></li>
							<li class="has-children"><a href="gallery/gallery.jsp">갤러리</a>
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
							<li><a href="search/search.jsp">도서검색</a></li>
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
			<div class="site-section site-block-3 bg-light">
		      <div class="container">
		        <div class="row">
		          <div class="col-lg-6 mb-5 mb-lg-0">
		            <div class="img-border">
		              <img src="images/s_reader.jpg" alt="Image" class="img-fluid">
		            </div>
		          </div>
		          <div class="col-lg-6">
		            <div id="about1" class="row row-items">
		              <div class="col-6">
		                <a href="#" class="d-flex text-center feature active p-4 mb-4 bg-white">
		                  <span class="align-self-center w-100">
		                    <h3>대출 회원</h3>
			                    <ul id="ul1" class="list-unstyled ul-check primary">
					              <li>누구나 무료로 도서관을 이용할 수 있습니다.</li>
					              <li>회원가입은 본인이 직접 도서관에 와서 신청하고,</li>
					              <li>간단한 도서관 소개 및 안내를 들으시면 됩니다.</li>
					            </ul>
		                  </span>
		                </a>
		              </div>
		              <div class="col-6">
		                <a href="#" class="d-flex text-center feature active p-4 mb-4 bg-white">
		                  <span class="align-self-center w-100">
		                    <h3>자료 대출</h3>
		                     	<ul class="list-unstyled ul-check primary">
					              <li>책을 빌릴 때는 대출증을 가져 옵니다.</li>
					              <li>한사람이 5개의 자료를 2주 동안 빌려볼 수 있습니다</li>
					              <li>(자원활동가 및 후원회원은 10개까지 가능)</li>
					            </ul>
		                  </span>
		                </a>
		              </div>
		            </div>
		            <div class="row row-items last">
		              <div class="col-6">
		                <a href="#" class="d-flex text-center feature active p-4 mb-4 bg-white">
		                  <span class="align-self-center w-100">
		                    <h3>자료 반납</h3>
		                    	<ul class="list-unstyled ul-check primary">
					              <li>빌려간 책은 제 날짜에 반납해주세요.</li>
					              <li>반납일을 넘기면 늦은 날 수만큼 책을 빌릴 수 없습니다.</li>
					              <li>(한 달 넘게 연체되어도 대출정지 기간은 최대 30일)</li>
					              <li>연체하여 책을 못 빌리는 경우가 없도록 연체를 사면해주는 다양한 이벤트가 있습니다.</li>
					            </ul>
		                  </span>
		                </a>
		              </div>
		              <div class="col-6">
		                <a href="#" class="d-flex text-center active feature active p-4 mb-4 bg-white">
		                  <span class="align-self-center w-100">
		                    <h3>자료 예약</h3>
		                    	<ul class="list-unstyled ul-check primary">
					              <li>보고 싶은 책이 대출중일 경우, 2권까지 예약할 수 있습니다. </li>
					              <li>예약하신 자료가 반납되면 전화 드려요.</li>
					              <li>(연락을 받으면 일주일 안에 빌려 가세요.)</li>
					            </ul>
		                  </span>
		                </a>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		    <!-- 상세검색 눌렀을 때 상세검색창 나타나게하는 jQuery -->	
							<script>
							$("#about1").hover(function(){
								
								$("#ul1").hide();
								
								
							});
							</script>
		    
		    <!-- 오시는 길 -->
		     <div class="site-half">
		      <div class="container">
		        <div class="row no-gutters align-items-stretch">
		          <div class="col-md-12 col-lg-7" style="padding-top: 6rem!important; margin-left: 50px;">
		            <span class="sub-title">오시는 길</span>
		            <h2 class="font-weight-bold text-black font-secondary mb-4">도서관 위치 안내</h2>
		            <ul class="list-unstyled ul-check primary">
		              <li>주소 : 부산광역시 북구 화명동 용당로</li>
		              <li>전화 : 051)000 - 0000</li>
		              <li>팩스 : 051)000 - 0000</li>
		              <li>지하철 : 부산 지하철 2호선 화명역 6번 출구 도보 10분</li>
		              <li>버스 : 59번, 111번, 121번, 126번 버스 탑승, 대림역에서 하차 후 도보 5분 </li>
		            </ul>
		          </div>
		          <div id="map" style="width:500px;height:400px; float: left; margin-top:15px; margin-left: -50px;"></div>
					<script>
						var container = document.getElementById('map');
						var options = {
							center: new kakao.maps.LatLng(35.233246, 129.009843),
							level: 3
						};
				
						var map = new kakao.maps.Map(container, options);
					</script>
		        </div>
		      </div>
		    </div>
		    <hr>
		    
		<!-- 자주하는 질문 -->
		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 mb-5 mb-lg-0">
						<div class="img-border">
							<img src="images/bookcatle.jpg" alt="Image" class="img-fluid">
						</div>
					</div>
					<div class="col-lg-5 ml-auto">
						<span class="sub-title">Q & A</span>
						<h2 class="font-weight-bold text-black mb-5">자주하는 질문</h2>
						<div class="accordion" id="accordionExample">

							<h2 class="mb-0 border rounded mb-2">
								<button class="btn" type="button" data-toggle="collapse"
									data-target="#collapseOne" aria-expanded="true"
									aria-controls="collapseOne">
									1. 위치를 알고싶어요.</button>
							</h2>

							<div id="collapseOne" class="collapse show"
								aria-labelledby="headingOne" data-parent="#accordionExample">
								<div class="card-body">
									<p>
										부산광역시 북구 용달로 <br>
										(도서관 문 앞에 반납함은 항상 열려있습니다.)
									</p>
								</div>
							</div>

							<h2 class="mb-0 border rounded mb-2">
								<button class="btn collapsed" type="button"
									data-toggle="collapse" data-target="#collapseTwo"
									aria-expanded="false" aria-controls="collapseTwo">
									2. 운영시간이 언제 인가요?</button>
							</h2>

							<div id="collapseTwo" class="collapse"
								aria-labelledby="headingTwo" data-parent="#accordionExample">
								<div class="card-body">
									<p>운영시간<br>
									수, 목요일 l 오전 10시~오후 6시<br>
									금요일 l 오전 10시~저녁 9시<br>
									토, 일요일 l 오전 10시~오후 5시<br>
									*매주 월, 화요일과 법정공휴일은 휴관일입니다.</p>
								</div>
							</div>

							<h2 class="mb-0 border rounded mb-2">
								<button class="btn collapsed" type="button"
									data-toggle="collapse" data-target="#collapseThree"
									aria-expanded="false" aria-controls="collapseThree">
									3. 책을 대여하려면 어떻게 해야하나요?</button>
							</h2>

							<div id="collapseThree" class="collapse"
								aria-labelledby="headingThree" data-parent="#accordionExample">
								<div class="card-body">
									<p>회원가입은 본인이 직접 도서관에 와서 신청하고<br>
									   회원카드를 발급 후 도서를 대여하실 수 있습니다.</p>
								</div>
							</div>

							<h2 class="mb-0 border rounded mb-2">
								<button class="btn collapsed" type="button"
									data-toggle="collapse" data-target="#collapseFour"
									aria-expanded="false" aria-controls="collapseFour">
									4. 읽고싶은 책이 도서관에 없다면?	</button>
							</h2>

							<div id="collapseFour" class="collapse"
								aria-labelledby="headingFour" data-parent="#accordionExample">
								<div class="card-body">
									<p>읽고 싶은 책을 신청해주시면 됩니다.<br>
										신청하신 책이 도서관에 들어오면,<br>
									      신청자에게 제일 먼저 대출할 수 있는 기회를 드립니다.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		    
		    
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

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/jquery.countdown.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/bootstrap-datepicker.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/main.js"></script>
    
  </body>
</html>
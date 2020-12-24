<%@page import="java.text.SimpleDateFormat"%>
<%@page import="gallery.GalleryBean"%>
<%@page import="java.util.List"%>
<%@page import="gallery.GalleryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="text/html; charset=UTF-8 width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/style.css">


</head>

<%
	request.setCharacterEncoding("UTF-8");
	GalleryDAO galleryDAO = new GalleryDAO();
	List<GalleryBean> list = null;
	list = galleryDAO.getGalleryNewContent();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//날짜 포맷

%>
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

		<div class="site-navbar-wrap">
				<!-- 최상단 -->
				<div class="site-navbar-top container py-4" style="text-align: right">
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
							<li class="active"><a href="index.jsp">도서관 소개</a></li>
								
							<li><a href="about.jsp">이용 안내</a></li>
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

		<div class="site-blocks-cover overlay"
			style="background-image: url(images/bookcatle2_cut.jpg);"
			data-aos="fade" data-stellar-background-ratio="0.5">
			<div class="container">
				<div
					class="row align-items-center text-center justify-content-center">
					<div class="col-md-8">
						<span class="sub-text">세상에서 하나뿐인 도서관</span>
						<h1>Our Tiny Library</h1>
					</div>
				</div>
			</div>
		</div>
		
		<div class="site-section  border-bottom">
			<div class="container">
				<div class="row">

					<div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
						<div class="media custom-media">
							<div class="mr-3 icon">
								<span class="flaticon-interior-design display-4"></span>
							</div>
							<div class="media-body">
								<h5 class="mt-0">공공성의 또 다른 이름, 도서관!</h5>
							
							</div>
						</div>
					</div>


					<div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
						<div class="media custom-media">
							<div class="mr-3 icon">
								<span class="flaticon-step-ladder display-4"></span>
							</div>
							<div class="media-body">
								<h5 class="mt-0">자발성과 역동성이 피어나는 곳, 민간도서관!</h5>
								
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mb-5 mb-lg-0">
						<div class="media custom-media">
							<div class="mr-3 icon">
								<span class="flaticon-turned-off display-4"></span>
							</div>
							<div class="media-body">
								<h5 class="mt-0">돌봄과 소통이 있는 곳, 마을도서관!</h5>
								
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		
		

		<!-- 신착도서 -->	
		<div class="site-section">
	      <div class="container">
	        <div class="row">
	          <div class="col-12 text-center">
	            <span class="sub-title">New Arrival books</span>
	            <h2 class="font-weight-bold text-black mb-5">신착도서</h2>
	          </div>
	        </div>
	        <div class="row">
	
	          <div class="col-lg-3 col-md-6 mb-4">
	            <div class="person">
	              <div class="bio-img">
	                <figure>
	                  <img src="images/thisyearbook/달러구트꿈백화점.jpg" alt="Image" class="img-fluid">
	                </figure>
	              </div>
	              <h2>이미예 지음</h2>
	              <span class="sub-title">달러구트 꿈 백화점</span>
	            </div>
	          </div>
	
	          <div class="col-lg-3 col-md-6 mb-4">
	            <div class="person">
	              <div class="bio-img">
	                <figure>
	                  <img src="images/thisyearbook/장수탕 선녀님.jpg" alt="Image" class="img-fluid">
	                </figure>
	              </div>
	              <h2>백희나 지음</h2>
	              <span class="sub-title">장수탕 선녀님</span>
	            </div>
	          </div>
	          
	          <div class="col-lg-3 col-md-6 mb-4">
	            <div class="person">
	              <div class="bio-img">
	                <figure>
	                  <img src="images/newbook/역사의쓸모.jpg" alt="Image" class="img-fluid">
	                </figure>
	              </div>
	              <h2>최태성 지음</h2>
	              <span class="sub-title">역사의 쓸모</span>
	            </div>
	          </div>
	
	          <div class="col-lg-3 col-md-6 mb-4">
	            <div class="person">
	              <div class="bio-img">
	                <figure>
	                  <img src="images/newbook/일인칭단수.jpg" alt="Image" class="img-fluid">
	                </figure>
	              </div>
	              <h2>무라카미 하루키 지음</h2>
	              <span class="sub-title">일인칭 단수</span>
	            </div>
	          </div>
	
	        </div>
	      </div>
	    </div>
	    <hr>
		
		<!-- 올해의 책  -->
		<div class="container site-section block-13 testimonial-wrap">
			<div class="row">
				<div class="col-12 text-center">
					<span class="sub-title">This year's book</span>
					<h2 class="font-weight-bold text-black mb-5">올해의 책</h2>
				</div>
			</div>

			<div class="nonloop-block-13 owl-carousel">

				<div class="testimony">
					<img src="images/thisyearbook/달러구트꿈백화점.jpg" alt="Image" class="img-fluid">
					<h3>이미예 지음</h3>
					<span class="sub-title">달러구트 꿈 백화점</span>
					<p>
						&ldquo;<em>주문하신 꿈은 매진입니다
						</em>&rdquo;
					</p>
				</div>

				<div class="testimony">
					<img src="images/thisyearbook/시선으로부터,.jpg" alt="Image" class="img-fluid">
					<h3>정세랑 지음</h3>
					<span class="sub-title">시선으로부터,</span>
					<p>
						&ldquo;<em>살아남은 모든 여성에게 존경과 사랑을</em>&rdquo;
					</p>
				</div>

				<div class="testimony">
					<img src="images/thisyearbook/작은아씨들.jpg" alt="Image" class="img-fluid">
					<h3>루이자 메이 올콧 지음</h3>
					<span class="sub-title">작은 아씨들</span>
					<p>
						&ldquo;<em>우리의 인생은 모두가 한 편의 소설이다</em>&rdquo;
					</p>
				</div>
				
				<div class="testimony">
					<img src="images/thisyearbook/지적대화를위한넓고얕은지식0.jpg" alt="Image" class="img-fluid">
					<h3>채사장 지음</h3>
					<span class="sub-title">지적대화를 위한 넓고 얕은 지식0</span>
					<p>
						&ldquo;<em>채사장 '지대넓얕' 시리즈 4년 만의 신간</em>&rdquo;
					</p>
				</div>
				
				<div class="testimony">
					<img src="images/thisyearbook/마음챙김의시.jpg" alt="Image" class="img-fluid">
					<h3>류시화 엮음</h3>
					<span class="sub-title">마음 챙김의 시</span>
					<p>
						&ldquo;<em>꽃피어야만 하는 것은, 꽃핀다</em>&rdquo;
					</p>
				</div>
				
				<div class="testimony">
					<img src="images/thisyearbook/김지은입니다.jpg" alt="Image" class="img-fluid">
					<h3>김지은 지음</h3>
					<span class="sub-title">김지은 입니다.</span>
					<p>
						&ldquo;<em>"지금 이 목소리를 듣는 일이 우리의 정의다"</em>&rdquo;
					</p>
				</div>
				
				<div class="testimony">
					<img src="images/thisyearbook/우리가우리를우리라고부를때.jpg" alt="Image" class="img-fluid">
					<h3>추적단 불꽃 지음</h3>
					<span class="sub-title">우리가 우리를 우리라고 부를때</span>
					<p>
						&ldquo;<em>여성 25인의 추천! 추적단 불꽃의 N번방 추적기!</em>&rdquo;
					</p>
				</div>
			</div>
		</div>

		<hr>
		
		<!-- 정보와 소식 -->
		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-12 text-center">
						<span class="sub-title">News &amp; Update</span>
						<h2 class="font-weight-bold text-black mb-5">정보와 소식</h2>
					</div>
				</div>
				<div class="row mb-5">
				<%
					
						for(int i=0; i<list.size(); i++){
							GalleryBean galleryBean = list.get(i);
				%>
					<div class="col-lg-4 col-md-6 mb-4 mb-lg-0 post-entry">
						<a href="gallery/content.jsp?num=<%=galleryBean.getNum()%>" class="d-block figure"> 
							<img src="<%=galleryBean.getFirst_image()%>" alt="Image" style="width: 100%; height: 350px;">
						</a> 
						<span class="text-muted d-block mb-2"><%=sdf.format(galleryBean.getDate())%></span>
						<h3>
							<a href="gallery/content.jsp?num=<%=galleryBean.getNum()%>"><%=galleryBean.getTitle()%></a>
						</h3>
					</div>
				<%		
	
					}
				%>			
				</div>
				<div class="row mt-5 text-center">
					<div class="col-12">
						<p>
							<a href="gallery/gallery.jsp" class="btn btn-primary btn-lg rounded-0">더보기</a>
						</p>
					</div>
				</div>
			</div>
		</div>

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
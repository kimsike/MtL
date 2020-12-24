<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>BOARD</title>
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
			style="background-image: url(../images/meditation.jpg);">
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
							<li class="has-children"><a href="board.jsp">게시판</a>
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
							<li class="active"><a href="search.jsp">도서검색</a></li>
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
			<div class="site-section1">
				<div class="container rounded content_border">
					<div class="l-section">
						<div class="page-header">
							<h1 class="h">검색목록</h1>	
						</div>
						<!-- 검색 -->
						<div class="board-search">
							<form action="board.jsp" name="search" method="post">
								<fieldset>
									<b>검색</b>
									<select name="keyword">
										<option value="title">제목</option>
										<option value="content">내용</option>
										<option value="id">작성자</option>
									</select>
									<input type="text" class="text" name="searchValue" placeholder="검색어를 입력해 주세요.">
									<button type="submit" class="btn">
										<span>검색</span>
									</button>
								</fieldset>
							</form>
						</div>
						<!-- 검색 -->
						<div class="book-list half-list">
                
                
		                <div class="book-list-item">
		                    <a href="/program/books/1311" class="inner">
		                        <div class="thumb thumb-book">        
		                        	<img src="../images/장수탕 선녀님.jpg" alt="" onerror="">                  
		                        </div>
		                        <div class="cont">
		                        	 <h3>제목</h3>
		                            <div class="category">
		                                <b>[주제]</b> 지은이 / 출판사
		                            </div>
		                        </div>
		                    </a>
		                </div>
		                <div class="book-list-item">
		                    <a href="/program/books/1311" class="inner">
		                        <div class="thumb thumb-book">        
		                        	<img src="../images/장수탕 선녀님.jpg" alt="" onerror="">                  
		                        </div>
		                        <div class="cont">
		                        	 <h3>제목</h3>
		                            <div class="category">
		                                <b>[주제]</b> 지은이 / 출판사
		                            </div>
		                        </div>
		                    </a>
		                </div> 
		                <div class="book-list-item">
		                    <a href="/program/books/1311" class="inner">
		                        <div class="thumb thumb-book">        
		                        	<img src="../images/장수탕 선녀님.jpg" alt="" onerror="">                  
		                        </div>
		                        <div class="cont">
		                        	 <h3>제목</h3>
		                            <div class="category">
		                                <b>[주제]</b> 지은이 / 출판사
		                            </div>
		                        </div>
		                    </a>
		                </div> 
		                <div class="book-list-item">
		                    <a href="/program/books/1311" class="inner">
		                        <div class="thumb thumb-book">        
		                        	<img src="../images/장수탕 선녀님.jpg" alt="" onerror="">                  
		                        </div>
		                        <div class="cont">
		                        	 <h3>제목</h3>
		                            <div class="category">
		                                <b>[주제]</b> 지은이 / 출판사
		                            </div>
		                        </div>
		                    </a>
		                </div>                 
             
					</div>
					<div class="list-func func-tr"></div>
					</div>
				</div>
			</div>
			<!-- 본문 끝 -->	
		
		

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
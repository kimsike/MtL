<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>BOOK SEARCH</title>
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
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>


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
			style="background-image: url(../images/question.jpg);">
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
		
		<!-- 본문  -->
		<div class="site-section bg-light">
			<div class="container1 rounded">
				<form action="bookList.jsp" class="p-5 bg-white col-md-12 rounded" >
					<h2 class="site-heading mb-5">
						<strong>도서</strong>찾기
					</h2>
					<a id="sdt" style="float: right; text-decoration: underline; margin-bottom: 5px;">상세검색</a>
					<div class="input-group mb-3" id="sps">
						<select name="search-keyword" class="search-keyword">
							<option>도서명</option>
							<option>저자</option>
							<option>출판사</option>
							<option>장르</option>
						</select>
						<input type="text" id="" class="form-control" placeholder="검색어를 입력하세요">
						<button type="submit" class="btn btn-primary" style="width: 20%; margin-left: -2px;" onclick="detail()">검색</button>
					</div>
					<div class="search-detail" id="sdtf">
						<div style="border: 10px solid #98ccd3; margin-bottom: 10px;">
							<input type="text" class="form-control" placeholder="도서명을 입력하세요"/>
						</div>
					
						<dl>
							<dt>저자</dt>
							<dd><input type="text" class=""></dd>
						</dl>
						<dl>
							<dt>출판사</dt>
							<dd><input type="text" class=""></dd>
						</dl>
						<dl>
							<dt>장르</dt>
							<dd><input type="text" class=""></dd>
						</dl>
						<dl>
							<dt>주제</dt>
							<dd>
								<select id="subjectCode" name="subjectCode">
									<option value="" selected="selected">전체</option>
									<option value="0">전쟁</option>
									<option value="1">철학</option>
									<option value="2">종교</option>
									<option value="3">사회과학</option>
									<option value="4">순수과학</option>
									<option value="5">기술과학</option>
									<option value="6">예술</option>
									<option value="7">언어</option>
									<option value="8">문학</option>
									<option value="9">역사</option>
								</select>
							</dd>
						</dl>
						<p style="text-align: center;">	
							<button type="submit" class="btn btn-primary">검색</button>
							<button type="reset" class="btn btn-primary">검색 초기화</button>
						</p>
						<div class="list-func func-tr"></div>
					</div>
				</form>
			</div>
		</div>
		
		<!-- 상세검색 눌렀을 때 상세검색창 나타나게하는 jQuery -->	
		<script>
		$("#sdt").click(function(){
			
			$("#sdtf").show();
			$("#sdt").hide();
			$("#sps").hide();
			
		});
		</script>
		
		<%if(id!=null && id.equals("admin")){ %>
		<div class="site-section bg-light" style="padding-top: 0 !important;">
			<div class="container1 rounded">
				<form action="book_register.jsp" class="p-5 bg-white col-md-12 rounded" >
					<h2 class="site-heading mb-5">
						<strong>도서</strong>등록
					</h2>
					
					<div class="book-register">
					<div style="border: 10px solid #98ccd3; margin-bottom: 10px;">
						<input type="text" class="form-control" placeholder="도서명을 입력하세요"/>
					</div>
						<dl>
							<dt>저자</dt>
							<dd><input type="text" class=""></dd>
						</dl>
						<dl>
							<dt>출판사</dt>
							<dd><input type="text" class=""></dd>
						</dl>
						<dl>
							<dt>장르</dt>
							<dd><input type="text" class=""></dd>
						</dl>
						<dl>
							<dt>주제</dt>
							<dd>
								<select name="subjectCode">
									<option value="" selected="selected">전체</option>
									<option value="0">전쟁</option>
									<option value="1">철학</option>
									<option value="2">종교</option>
									<option value="3">사회과학</option>
									<option value="4">순수과학</option>
									<option value="5">기술과학</option>
									<option value="6">예술</option>
									<option value="7">언어</option>
									<option value="8">문학</option>
									<option value="9">역사</option>
								</select>
							</dd>
						</dl>
						<p style="text-align: center;">	
							<button type="submit" class="btn btn-primary">등록</button>
							<button type="reset" class="btn btn-primary">다시입력</button>
						</p>
						<div class="list-func func-tr"></div>
					</div>
				</form>
			</div>
		</div>
		<%}%>
		
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
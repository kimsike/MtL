

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>update</title>
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
	<%
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDAO boardDAO = new BoardDAO();
		//글 번호에 해당 되는 글의 정보 검색
		BoardBean boardBean = boardDAO.getBoard(num);
		
		int DBnum = boardBean.getNum();
		int DBreadCount = boardBean.getReadcount();
		String DBid = boardBean.getId();
		String DBpassword = boardBean.getPassword();
		Timestamp DBdate = boardBean.getDate();
		String DBip = boardBean.getIp();
		String DBfile = boardBean.getFile();
		String DBsavedFile = boardBean.getSavedFile();		
		String DBtitle = boardBean.getTitle();
		String DBcontent = "";
		if(boardBean.getContent() != null){
			DBcontent = boardBean.getContent().replace("<br>", "\r\n");
			
		}
		int DBRe_ref = boardBean.getRe_lev();//주글의 그룹번호
		int DBRe_lev = boardBean.getRe_lev();//주글의 들여쓰기 정도값
		int DBRe_seq = boardBean.getRe_seq();//주글들 내의 순서값
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
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
						<a href="../member/myProfile.jsp">MYPAGE</a>
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
							<li class="has-children active"><a href="board.jsp">게시판</a>
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
			<div class="site-section1">
				<div class="container">
				
					<div class="l-section">
						<div class="page-header">
							<h1 class="h" style="width: 150px; height: 30px; margin-bottom: 30px; font-weight: bold;">글수정</h1>	
							<div style="text-align: right;" >
								<input type="button" value="글 목록" onclick="location.href='board.jsp?pageNum=<%=pageNum%>'" class="btn btn-b">
							</div>
						</div>
						
						<form action="updatePro.jsp" method="post"  enctype="multipart/form-data" class="board-write">						
							<input type="hidden" name="num" value="<%=num%>" >
							<input type="hidden" name="pageNum" value="<%=pageNum%>">
							<input type="hidden" name="id" value="<%=id%>">
							<table class="table">
								<colgroup>
									<col width="20%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>제목</th>
										<td>
											<input type="text" name="title" value="<%=DBtitle%>" class="text text-max">
										</td>
									</tr>
									<tr>
										<th>내용</th>
										<td>
											<textarea name="content" class="text-max"><%=DBcontent%></textarea>
										</td>
									</tr>
									<tr>
										<th>첨부파일</th>
										<td>
											<input type="file" name="file" class="text text-max validation_file">
											
										<%
											if(DBfile != null){
										%>		
												<span>첨부파일 : </span>
												<span><%=DBfile%></span>
												<span style="margin-left: 20px;"><a href="fileDelete.jsp?fileName=<%=DBsavedFile%>&num=<%=num%>&pageNum=<%=pageNum%>">파일삭제</a></span>
										<%
											}
										%>	
											
										</td>
									</tr>
								</tbody>
							</table>
							<div style="text-align: right;">
								<input type="submit" value="수정" class="btn btn-b">
								<input type="button" value="취소" class="btn btn-b" onclick="history.back();">
							</div>
							<div class="list-func func-tr"></div>
						</form>
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
		<!-- 푸터 끝 -->
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
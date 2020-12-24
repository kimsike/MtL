<%@page import="galleryComment.GalleryCommentBean"%>
<%@page import="galleryComment.GalleryCommentDAO"%>
<%@page import="gallery.GalleryBean"%>
<%@page import="gallery.GalleryDAO"%>
<%@page import="javax.xml.stream.events.Comment"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>content</title>
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

<script type="text/javascript">
	function commentInsert() {
		if(session.getAttribute("id") == null){
			alert("로그인이 필요합니다");
		}
	}
</script>

</head>
<%
	 //한글처리
	request.setCharacterEncoding("UTF-8");
	//글번호
	int num = Integer.parseInt(request.getParameter("num"));
	//페이지번호
	String pageNum = request.getParameter("pageNum");	
	
	GalleryDAO galleryDAO = new GalleryDAO();
	//조회수 1증가
	galleryDAO.updateReadCount(num);
	//num에 해당하는 글번호의 글의 정보 검색
	GalleryBean galleryBean = galleryDAO.getGallery(num);
	
	int Gnum = galleryBean.getNum();
	int GreadCount = galleryBean.getReadcount();
	String Gid = galleryBean.getId();
	String Gpassword = galleryBean.getPassword();
	Timestamp Gdate = galleryBean.getDate();
	String Gip = galleryBean.getIp();
	String Gfirst_image = galleryBean.getFirst_image();
	String Gthumbnail = galleryBean.getThumbnail();
	String Gtitle = galleryBean.getTitle();
	String Gcontent = "";
	if(galleryBean.getContent() != null){
		Gcontent = galleryBean.getContent().replace("<img", "<img style='max-width:566px;' ");			
	}
			
	
	//--------------------------------------------------------
	
	//댓글 처리 관련 검색한 필드 정보 얻기
	GalleryCommentDAO gcommentDAO = new GalleryCommentDAO();
	GalleryCommentBean gcommentBean = new GalleryCommentBean();
	gcommentBean = gcommentDAO.getComment(num);
	
	int count = gcommentDAO.getCommentCount(num);
	
	int pageSize = 10;
	String gcommentPage = request.getParameter("gcommentPage");
	if(gcommentPage == null){
		gcommentPage = "1";
	}
	
	int currentPage = Integer.parseInt(gcommentPage);
	
	int startRow = (currentPage - 1) * pageSize;
	
	List<GalleryCommentBean> list = null;
	if(count > 0){
		list = gcommentDAO.getCommentList(startRow, pageSize, num);
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd kk:mm");
	
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
			style="background-image: url(../images/sitting_cut.jpg);">
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
							<li class="has-children active"><a href="gallery.jsp">갤러리</a>
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
				<div class="container rounded content_border">
					<div class="l-section">
						<div class="page-header">
							<h1 class="h" style="width: 150px; height: 30px; margin-bottom: 30px; font-weight: bold;">내용</h1>
							<div style="text-align: right;" >
								<input type="button" value="글 목록" onclick="location.href='gallery.jsp?pageNum=<%=pageNum%>'" class="btn btn-b">
							</div>
						</div>
						<div class="board-view">
							<div class="board-view-head">
								<h3><%=Gtitle%></h3>
								<div class="info">
									<span><%=Gid%></span>
									<span><%=sdf.format(Gdate)%></span>
								</div>
							</div>
							<dl>
								<dt style="border-bottom: 1px solid #dddddd; margin-bottom: 10px;"> 
							
								<dd><%=Gcontent%></dd>
							</dl>
							<div class="board-view-cont">
							</div>
						</div>
						<%	
							if(id == null){//로그인이 되어있지 않으면
								
							}else if(id.equals(Gid)){//로그인하고 내가 쓴 글 클릭시
						%>
								<div style="text-align: right; margin-top: 20px;" >
									<input type="button" value="글수정" onclick="location.href='update.jsp?num=<%=Gnum%>&pageNum=<%=pageNum%>'" class="btn btn-b">
									<input type="button" value="글삭제" onclick="contentDelete();"  class="btn btn-b">
								</div>
						<%	
							}else{//로그인하고 다른 사람의 글 클릭시
								
							}
						%>
						<!-- 글삭제 버튼 클릭시 확인창 -->
						<script type="text/javascript">
						function contentDelete() {
							
							if(confirm("글을 삭제하시겠습니까?")){
								
								location.href="delete.jsp?num=<%=Gnum%>&pageNum=<%=pageNum%>";
							}
							
						}
						</script>
						
						<!-- 댓글 -->
						<span class="board-reply-num">댓글<%=count%>건</span>
						<div class="board-reply">
								
					<%
						if(count > 0){
							for(int i=0; i<list.size(); i++){
								GalleryCommentBean gallcommBean = new GalleryCommentBean();
								gallcommBean = list.get(i);
								int comment_num = gallcommBean.getComment_num();
								
								int wid = 0;
								if(gcommentBean.getComment_lev() > 0){//답댓글이라면
									wid = gallcommBean.getComment_lev() * 15;
					%>
								<span style="width:'<%=wid%>' height='40'">└</span>
					<%	
								}
					%>	
							<ul class="board-reply-list">
								<li>
									<div class="cont">
										<!-- <i class="icon icon-user-default"></i> -->	
										<input type="hidden" >
										<span class=""><%=gallcommBean.getId()%></span>
										<span class=""><%=sdf.format(gallcommBean.getDate())%></span>
										<span style="float: right;" >
					<%
										if(id == null){//로그인을 안했을 경우
						
										}else if(id != null && id.equals(gallcommBean.getId())){//로그인 한 경우
					%>
										<input type="button" value="수정" id="modrp<%=gallcommBean.getComment_num()%>" class="btn">
										<input type="button" value="삭제" onclick="comment_delete();" class="btn ">
										<input type="button" value="답글" onclick="" class="btn">					
					<%
										}else{
					%>						
										<input type="button" value="답글" onclick="location.href='write.jsp'" class="btn">		
					<%
										}
					%>
										</span>
										<p><%=gallcommBean.getComment()%></p>
										
									</div>
								</li>
							</ul>
							
							<!-- 댓글 수정 시 toggle되는 수정창 -->
								<div class="board-reply-write1" id="rwrp<%=i%>" style="display: none;">
									<form action="comment_update.jsp" method="post" id="rwf<%=i%>">
										<input type="hidden" name="comment_num" value="<%=comment_num%>">
										<input type="hidden" name="num" value="<%=num%>" >
										<input type="hidden" name="pageNum" value="<%=pageNum%>" >
										<div class="text-area" style="width: 90%; float: right;">
											<textarea name="comment" rows="10" cols="30"><%=gallcommBean.getComment()%></textarea>
										</div>
										<button type="submit" class="btn btn-b">
											<span>수정</span>
										</button>
									</form>
								</div>
							
							<!-- 댓글 수정 눌렀을 때 수정창 나타나게하는 jQuery -->	
							<script>
							$("#modrp"+<%=gallcommBean.getComment_num()%>).click(function(){
								
								$("#rwrp"+<%=i%>).toggle();
								$(".board-reply-write1").not("#rwrp"+<%=i%>).hide();
							});
							</script>
							
							<!-- 댓글 삭제 버튼 클릭시 확인창  -->
							<script type="text/javascript">
								function commentDelete() {
									
									if(confirm("댓글을 삭제하시겠습니까?")){
										
										location.href="comment_delete.jsp?comment_num=<%=comment_num%>&num=<%=num%>&pageNum=<%=pageNum%>";
									
									}
								}	
							</script>
					<%		
					
							}//댓글 for문 끝
						}//댓글 if문 끝
					
							
					%>	
						<!--댓글 페이징 -->
						<div class="row" style="margin-top: 30px; margin-bottom: 30px;">
							<div class="col-md-12 text-center">
								<div class="site-block-27">
									<ul>
								<%
									if(count > 0){
										//전체 페이지 수
										int pageCount = count / pageSize + (count % pageSize == 0? 0 : 1);
										//한 화면에 보이는 페이지 수
										int pageBlock = 3;
										//시작페이지 번호
										int startPage = ((currentPage / pageBlock)-(currentPage % pageBlock == 0? 1:0)) * pageBlock +1;
										//끝 페이지 번호
										int endPage = startPage + pageBlock -1;
										
										if(startPage > pageBlock){
								%>
											<li><a href="content.jsp?num=<%=num %>&commentPage=<%=startPage-pageBlock%>">&lt;</a></li>
								<%
										}
									//페이지 번호
									for(int i=startPage; i<=endPage; i++){						
								%>
												<li id="commentPage<%=i%>"><a href="content.jsp?num=<%=num%>&commentPage=<%=i%>"><%=i%></a></li>
								<%		
										}//for문
								%>	
									<!-- 해당페이지만 색깔 다르게 페이징 -->
									<script>
		      							document.getElementById("commentPage"+<%=currentPage%>).setAttribute("class", "active");
		   							</script>
								<%	
										if(endPage < pageCount){
								%>
											<li><a href="content.jsp?num=<%=num %>&commentPage=<%=startPage+pageBlock%>">&gt;</a></li>
								<%			
										}
									}
								%>
									</ul>
								</div>
							</div>
						</div>
						<!--댓글 페이징 끝 -->
						<%
							if(id == null){
						%>
							<div class="board-reply-logout">
							"로그인 후 이용 가능합니다."
					
							</div>
						<%} %>
							<div class="board-reply-write">
							<form action="comment.jsp" method="post">
								<input type="hidden" name="num" value="<%=num%>">
								<input type="hidden" name="pageNum" value="<%=pageNum%>">
								<input type="hidden" name="id" value="<%=session.getAttribute("id")%>">
								<div class="text-area">
									<textarea name="comment" rows="10" cols="30" placeholder="댓글은 최대 150자까지 입력 가능합니다. "></textarea>
								</div>
								<button type="submit" class="btn btn-b" onclick="commentInsert();">
									<span>입력</span>
								</button>
							</form>
							</div>
						</div>
						<!-- 댓글 -->
					
						
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
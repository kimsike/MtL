<%@page import="member.EmailConfirm"%>
<%@page import="comment.CommentDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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

<script type="text/javascript">
	function back() {
		window.history.back();
	}
	function sendEmail() {
		var email = insertform.email1.value;
		location.href="emailCheck.jsp?email="+email;
	}

</script>

<script type="text/javascript">
	function selfinsert(){
		insertform.email3.focus();
	}
	/*이메일 입력 후  인증 */
	function emailcheck(email1, email2){
	    
		var email1 = insertform.email1.value;
		var email2 = insertform.email2.value;
		var email3 = insertform.email3.value;
		
		// 유효성 검사
		if(!email1 || !email2){ 
			alert("이메일을 입력해주세요.");
			insertform.email1.focus();
			return;
		}else{
			if(email1){
				if(email2==0){
					// 직접입력
					if(!email3){
						alert("이메일을 입력해주세요.");
						insertform.email3.focus();
						return false;
					}
				}else{	
					// 선택입력
					if(email1.indexOf("@")!=-1){
						alert("메일을 정확히 입력해주세요.");
						insertform.email1.focus();
						return false;
					}
				}
			}
		}
	    
		var url="emailCheck.jsp?email1="+email1+"&email2="+email2+"&email3="+email3;
	
		// 인증을 위해 새창으로 이동
		//open(url,"emailwindow", "statusbar=no, scrollbar=no, menubar=no, width=400, height=200" ); 
		location.href=url; 
	}
	
	function confirmemail(emailconfirm_value, authNum){
	    // 입력한 값이 없거나, 인증코드가 일지하지 않을 경우
		if(!emailconfirm_value || emailconfirm_value != authNum){
			alert(emailconfirmerror);
			emailconfirm_value="";
			self.close();
	    // 인증코드가 일치하는 경우
		}else if(emailconfirm_value==authNum){
			alert(emailconfirm);
			emailconfirm_value="";
			self.close();
			opener.document.insertform.emailconfirm_value.value=1;
		}
	} 
</script>
</head>
	<%
		String authNum = request.getParameter("authNum");
		if(authNum != null || authNum != "" ){
			authNum = authNum;
		}
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

		<div class="site-blocks-cover overlay inner-page" style="background-image: url(../images/meditation.jpg);">
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
				<div class="container rounded"  style="padding-left: 100px; padding-right: 100px;">
					<div class="l-section content_border">
						<div class="page-header">
							<h1 class="h" style="width: 200px; height: 30px; margin-bottom: 50px; font-weight: bold;">
							회원가입</h1>
							<div class="l-join">
				                <div class="join">
				                    <form action="">
				                        <fieldset>
				                            <legend>이용약관</legend>
				                            <section class="join-document">
				                                <iframe src="">프레임이 지원 되지 않는 환경입니다. <a href="" target="_blank">이용약관</a> 페이지를 방문하여 주세요.</iframe>
				                            </section>
				                        </fieldset>
				                        <label><input type="checkbox" id="check1" value="Y"> 이용약관에 동의합니다.</label>
				                    </form>
				                </div>
				
				                <div class="join">
				                    <form action="">
				                        <fieldset>
				                            <legend>개인정보취급방침</legend>
				                            <section class="join-document">
				                                <iframe src="" >프레임이 지원 되지 않는 환경입니다. <a href="" target="_blank">개인정보취급방침</a> 페이지를 방문하여 주세요.</iframe>
				                            </section>
				                        </fieldset>
				                        <label><input type="checkbox" id="check2" value="Y"> 개인정보취급방침에 동의합니다.</label>
				                    </form>
				                </div>
				            </div>
			            </div>
					</div>
					
					
					<!-- 이메일 인증 -->
					<form action="register.jsp" id="form" name=insertform method="post" class="board-write">
				        <div class="l-section confirm content_border">
				            <div class="confirm-h">
				                <h1 class="h" style="text-align: center;">E-MAIL 인증</h1>
				            </div>
				            <div class="confirm-cont" style="margin: 0 auto; float: right;">
				                <p class="disc">본인 확인을 위한 인증 절차입니다. 정확한 정보를 입력하여 주세요.</p>
				                    <table class="table">
				                        <colgroup>
				                            <col width="20%">
				                            <col width="*">
				                        </colgroup>
				                        <tbody>
				                            <tr>
				                                <th>E-mail</th>
				                                <td>
				                                    <input type="text" name="email1" maxlength="15">
													@ <select name="email2">
													      <option value="0" onchange="selfinsert()">직접입력</option>
													      <option value="naver.com">naver.com</option>
													      <option value="daum.net">daum.net</option>
													      <option value="nate.com">nate.com</option>
													      <option value="gmail.com">gmail.com</option>
													  </select>
													  <input type="text" name="email3">
													  <div>
													  
													<input type="button" name="emailconfirm_btn" value="인증번호 발송"  class="btn btn-gray-dark"
											         onclick="emailcheck(insertform.email1.value, insertform.email2.value);">
				                                    <button type="button" class="btn btn-gray" onclick="sendEmail();"><span>재전송</span></button></div>
				                                </td>
				                            </tr>
				                            <tr>
				                                <th>인증번호</th>
				                                <td>
				                                    <input type="text" name="key" id="key" value="" class="text text-max">
				                                </td>
				                            </tr>
				                        </tbody>
				                    </table>
				                <div class="func">
						            <button type="button" class="btn btn-r" onclick="back();"><span>취소</span></button>
						            <button type="submit" class="btn btn-r" onclick="confirmemail(emailcheck.emailconfirm.value, <%-- <%=authNum%> --%>)"><span>확인</span></button>
				      		  	</div>
				            </div>
				        </div>	
					</form>	    
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
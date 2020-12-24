<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
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
	<%
	 	request.setCharacterEncoding("UTF-8");
		String id = (String)session.getAttribute("id");
		MemberBean memberBean = new MemberBean();
		MemberDAO memberDAO = new MemberDAO();
		
		memberBean = memberDAO.getMember(id);
		String Mid = memberBean.getId();
		String Mpassword = memberBean.getPassword();
		String Mname = memberBean.getName();
		String Memail = memberBean.getEmail();
		String Mmobile = memberBean.getMobile();
		String Mpostcode = memberBean.getPostcode();
		String Maddress1 = memberBean.getAddress1();
		String Maddress2 = memberBean.getAddress2();
		String Maddress3 = memberBean.getAddress3();  
	%>
<!-- 우편번호 검색 script -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		
		function passwordChange() {
			var pform = document.psfr;
			if(!pform.checkPassword.value){
				alert("비밀번호를 입력해 주세요.");
				pform.checkPassword.focus();
				return false;
			}
			
			if(!pform.updatePassword.value){
				alert("신규 비밀번호를 입력해 주세요.");
				pform.updatePassword.focus();
				return false;
			}
			
			if(pform.checkPassword.value == pform.updatePassword.value){
				alert("비밀번호가 기존 비밀번호와 일치합니다.");
				pform.updatePassword.focus();
				return false;
			}
			
			if(!pform.rePassword.value){
				alert("비밀번호를 다시한번 입력해주세요.");
				pform.rePassword.focus();
				return false;
			}
			
			if(pform.updatePassword.value != pform.rePassword.value){
				alert("비밀번호가 일치하지 않습니다.");
				pform.rePassword.focus();
				return false;
			}
		}
		
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
			style="background-image: url(../images/sofa.jpg);">
			<div class="site-navbar-wrap">
				<!-- 최상단 -->
				<div class="site-navbar-top container py-4"
					style="text-align: right">
					<h2 class="mb-0 site-logo">
						<a href="../index.jsp" style="float: left;">작은도서관</a>
					</h2>
				<%
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
							<h1 class="rmain">마이페이지</h1>
							
							<div class="l-join">
							<h4>회원정보 수정</h4>
							<form  action="updateMember.jsp" name="myInfoForm" id="myInfoForm" class="board-write" method="post">
			                    <input type="hidden" name="id" value="<%=id%>">
			                    
			                    <table class="table">
			                        <colgroup>
			                            <col width="20%">
			                            <col width="*">
			                        </colgroup>
			                        <tbody>
			                            <tr>
			                                <th>아이디</th>
			                                <td ><%=Mid %></td>
			                            </tr>
			                            <tr>
			                                <th>이름</th>
			                                <td><%=Mname %></td>
			                            </tr>
			                            <tr>
			                                <th>E-mail</th>
			                                <td><%=Memail %></td>
			                            </tr>
			                            <tr>
			                                <th>연락처</th>
			                                <td>
			                                    <input type="text" id="phone" name="mobile" value="<%=Mmobile %>" class="form-control text">
			                                </td>
			                            </tr>
			                            <tr>
			                                <th>주소</th>
			                                <td>
			                                	<div style="display: flex;">
			                         	    	<input type="text" id="sample6_postcode" name="postcode" value="<%=Mpostcode%>" class="form-control text-middle-password">
												<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 검색"><br>
												</div>
												<input type="text" id="sample6_address" name="address1" value="<%=Maddress1%>" class="form-control text"><br>
												<input type="text" id="sample6_detailAddress" name="address2" value="<%=Maddress2%>" class="form-control text-middle-password">
												<input type="text" id="sample6_extraAddress" name="address3" value="<%=Maddress3%>" class="form-control text-middle-password">
			                                </td>
			                            </tr>
			                        </tbody>
			                    </table>
			                	<button type="submit" class="btn btn-r"><span>정보수정</span></button>
			                </form>
			                <button type="submit" class="btn btn-r" onclick="deleteMember();"><span>회원탈퇴</span></button>
			               	<!-- 회원탈퇴 클릭시 확인창 -->
			               	<script>
			               		function deleteMember() {
			               			
			               			if(confirm("탈퇴시 작성한 글과 댓글이 모두 삭제됩니다. 정말로 회원탈퇴하시겠습니까?")){
			               				
			               				location.href="deleteMember.jsp?id=<%=id%>";
			               			}
								}
			               	
			               	</script>
			               
			               
			                </div>
			                
			                <div class="l-join">
				                <h4 class="dot-h">비밀번호 변경</h4>
				                <form name="psfr" action="updatePassword.jsp" class="board-write" method="post" onsubmit="return passwordChange();">
				                   <input type="hidden" name="id" value="<%=id%>">
				                   <input type="hidden" name="password" value="<%=Mpassword%>">
				                    <table class="table" style="margin-bottom: 10px !important;">
				                        <colgroup>
				                            <col width="20%">
				                            <col width="*">
				                        </colgroup>
				                        <tbody>
				                            <tr>
				                                <th>기존 비밀번호</th>
				                                <td>
				                                    <div class="passwrod-wrap">
				                                        <input type="password" class="form-control text" 
				                                        name="checkPassword" placeholder="기존 비밀번호를 입력해 주세요.">
				                                    </div>
				                                </td>
				                            </tr>
				                            <tr>
				                                <th>신규 비밀번호</th>
				                                <td>
				                                    <div class="passwrod-wrap">
				                                        <input type="password" class="form-control text" 
				                                        name="updatePassword" placeholder="신규 비밀번호를 입력해 주세요.">
				                                    </div>
				                                    <i class="file-notice-inline">영문과 숫자를 혼합하여 10~20자리를 입력하세요.</i>
				                                </td>
				                            </tr>
				                            <tr>
				                                <th>신규 비밀번호 재입력</th>
				                                <td>
				                                    <div class="passwrod-wrap">
				                                        <input type="password" class="form-control text" 
				                                        name="rePassword" placeholder="신규 비밀번호를 입력해 주세요.">
				                                    </div>
				                                    <i class="file-notice-inline">영문과 숫자를 혼합하여 10~20자리를 입력하세요.</i>
				                                </td>
				                            </tr>
				                        </tbody>
				                    </table>
				                    <button type="submit" class="btn btn-r"><span>변경</span></button>
								</form>			                
				            </div>
						</div>
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
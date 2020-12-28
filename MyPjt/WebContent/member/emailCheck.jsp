<%@page import="member.EmailConfirm"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
String email = null;
String email1 = request.getParameter("email1");
String email2 = request.getParameter("email2");
String email3 = request.getParameter("email3");
if(!email1.equals("")){
	if(email2.equals("0")){
		// 직접입력
		email=email1+"@"+email3;
	}else{
		email=email1+"@"+email2;
	}
}
// 위에서 작성한 java파일 객체 생성
EmailConfirm emailconfirm = new EmailConfirm();
String authNum=emailconfirm.connectEmail(email);
%>
<script>
alter("인증번호가 발송되었습니다.");
</script>
<%
response.sendRedirect("email.jsp?authNum="+authNum);
%>


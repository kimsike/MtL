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

<form action="email.jsp?email1=<%=email1%>&email2=<%=email1%>&email3=<%=email1%>" method="post" name="emailcheck">
<input type="hidden" name="authNum" value="<%=authNum%>">
	<table>
		<tr>
			<th colspan="2">인증번호가 발송되었습니다.</th>
		</tr>
		<tr>
			<td>
				<input type="submit" value="확인">
			</td>
		</tr>
	</table>
</form>

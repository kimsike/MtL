<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String checkPassword = request.getParameter("checkPassword");
	String updatePassword = request.getParameter("updatePassword");
	String rePassword = request.getParameter("rePassword");
	
%>
<script>
<%
	if(!password.equals(checkPassword)){
%>
		alert("비밀번호 변경에 실패하였습니다.");
		history.back();
<%	
	}else{
%>
	
		if(confirm("비밀번호를 변경하시겠습니까?")==true){
		
<%	
			MemberDAO memberDAO = new MemberDAO();
			memberDAO.updatePassword(updatePassword, id);
%>
			alert("변경되었습니다.");
			
			location.href="myPage.jsp";
		}else{
			history.back();
		}
<%
	}
%>
</script>	
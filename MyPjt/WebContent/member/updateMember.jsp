<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
%>
	<jsp:useBean id="memberBean" class="member.MemberBean"/>
	<jsp:setProperty property="*" name="memberBean"/>
	
	<jsp:useBean id="memberDAO" class="member.MemberDAO"/>
	
	<script>
		if(confirm("회원정보를 수정하시겠습니까?")==true){
<%
			memberDAO.updateMember(memberBean, id);
%>		
			location.href="myPage.jsp";
		}else{
			history.go(-1);
		}
	
	</script>	

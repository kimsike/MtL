<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	MemberDAO memberDAO = new MemberDAO();
	
	//check = 1 -> 아이디, 비밀번호  맞음
	//check = 0 -> 아이디 동일, 비밀번호 틀림
	//check =-1 -> 아이디, 비밀 번호 틀림
	int check = memberDAO.userCheck(id, password);
	
	if(check == 1){
		
		session.setAttribute("id", id);
		response.sendRedirect("../index.jsp");
		//response.sendRedirect(request.getHeader("referer"));
 		
	} else if(check == 0) {
%>
		<script>
			alert("비밀번호가 틀립니다.");
			history.back();
		</script>
<%			
	} else {
%>
		<script>
			alert("아이디가 존재하지 않습니다.");
			history.go(-1);
		</script>
<%		
	}
%>	

	
		
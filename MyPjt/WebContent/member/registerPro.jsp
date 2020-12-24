<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>	
	<jsp:useBean id="memberbean" class="member.MemberBean"/>
	<jsp:setProperty property="*" name="memberbean"/>
	
	<jsp:useBean id="memberDAO" class="member.MemberDAO"/>

<%
	String mobile = request.getParameter("mobile") + request.getParameter("mobile2");
	
	memberbean.setMobile(mobile);
	
	memberDAO.insertMember(memberbean);

	response.sendRedirect("login.jsp");	
%>
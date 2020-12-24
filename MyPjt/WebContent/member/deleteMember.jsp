<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	MemberDAO memberDAO = new MemberDAO();
	memberDAO.deleteMember(id);
	session.invalidate();
	
	response.sendRedirect("../index.jsp");
%>
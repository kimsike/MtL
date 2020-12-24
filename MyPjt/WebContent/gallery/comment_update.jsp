<%@page import="galleryComment.GalleryCommentDAO"%>
<%@page import="java.sql.Timestamp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="gallcommBean" class="galleryComment.GalleryCommentBean"/>
	<jsp:setProperty property="*" name="gallcommBean"/>
<%
	String id = (String)session.getAttribute("id");
	
	if(id == null){
		response.sendRedirect("../member/login.jsp");
	}
	
	int num = Integer.parseInt(request.getParameter("num"));
	int comment_num = Integer.parseInt(request.getParameter("comment_num"));	
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	String comment = request.getParameter("comment");
	
	Timestamp timestamp = new Timestamp(System.currentTimeMillis());
	String ip = request.getRemoteAddr();
	
	gallcommBean.setComment(comment);
	gallcommBean.setDate(timestamp);
	gallcommBean.setIp(ip);
	gallcommBean.setComment_num(comment_num);
	new GalleryCommentDAO().updateComment(gallcommBean);
	
	response.sendRedirect("content.jsp?num="+num+"&pageNum="+pageNum);

%>

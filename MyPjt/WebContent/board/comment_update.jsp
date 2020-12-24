<%@page import="java.sql.Timestamp"%>
<%@page import="comment.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="commentBean" class="comment.CommentBean"/>
	<jsp:setProperty property="*" name="commentBean"/>
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
	
	commentBean.setComment(comment);
	commentBean.setDate(timestamp);
	commentBean.setIp(ip);
	commentBean.setComment_num(comment_num);
	new CommentDAO().updateComment(commentBean);
	
	response.sendRedirect("content.jsp?num="+num+"&pageNum="+pageNum);

%>

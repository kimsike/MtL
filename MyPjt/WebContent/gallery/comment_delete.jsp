<%@page import="galleryComment.GalleryCommentDAO"%>
<%@page import="comment.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		new GalleryCommentDAO().deleteComment(comment_num);
		response.sendRedirect("content.jsp?num="+num+"&pageNum="+pageNum);
	%>	


<%@page import="gallery.GalleryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 	
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		//new GalleryDAO.getGallery
		
		
		//new BoardDAO().deleteContent(num);
		//response.sendRedirect("board.jsp?pageNum="+pageNum);

		new GalleryDAO().deleteGalleryContent(num);
		response.sendRedirect("gallery.jsp?pageNum="+pageNum);
%>


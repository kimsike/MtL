<%@page import="gallery.GalleryDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>
	<jsp:useBean id="galleryBean" class="gallery.GalleryBean"/>
	<jsp:setProperty property="*" name="galleryBean"/>
<% 
	String id = (String)session.getAttribute("id");
	 
	if(id == null){
		response.sendRedirect("../member/login.jsp");
	}
	
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");

	Matcher match = pattern.matcher(content);
	   String imgPath1 = null;
	   String imgPath2 = null;
	   String imgPath3 = null;
	   String imgPath4 = null;
	   String imgPath5 = null;
	   
	   if(match.find()){ // 이미지 태그를 찾았다면,,
	       imgPath1 = match.group(0); // 글 내용 중에 첫번째 이미지 태그를 뽑아옴.
/* 	       imgPath2 = match.group(1);
	       imgPath3 = match.group(2);
	       imgPath4 = match.group(3);
	       imgPath5 = match.group(4); */
	   }
	imgPath1 = imgPath1.substring(10, imgPath1.length()-2);   
/* 	imgPath2 = imgPath2.substring(31, imgPath2.length()-2);
	imgPath3 = imgPath3.substring(31, imgPath3.length()-2); 
	imgPath4 = imgPath4.substring(31, imgPath4.length()-2); 
	imgPath5 = imgPath5.substring(31, imgPath5.length()-2);  */
	
	galleryBean.setId(id);
	galleryBean.setTitle(title);
	galleryBean.setContent(content);
	galleryBean.setDate(new Timestamp(System.currentTimeMillis()));
	galleryBean.setIp(request.getRemoteAddr());
	galleryBean.setFirst_image(imgPath1);
	
	new GalleryDAO().insertGallery(galleryBean);
	
	response.sendRedirect("gallery.jsp");
	
%>
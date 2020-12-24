<%@page import="gallery.GalleryDAO"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>	
	<jsp:useBean id="galleryBean" class="gallery.GalleryBean"/>
	<jsp:setProperty property="*" name="galleryBean"/>
<%
	 
	String id = (String)session.getAttribute("id");
	
	if(id == null){
		response.sendRedirect("../member/login.jsp");
	}
	String num = request.getParameter("num");
	String pageNum = request.getParameter("pageNum");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");

	Matcher match = pattern.matcher(content);
	String imgPath = null;
	   
	   if(match.find()){ // 이미지 태그를 찾았다면,,
	       imgPath = match.group(0); // 글 내용 중에 첫번째 이미지 태그를 뽑아옴.
	   }
	imgPath = imgPath.substring(10, imgPath.length()-2);   
	System.out.println("imgPath : " + imgPath);
	
	galleryBean.setId(id);
	galleryBean.setTitle(title);
	galleryBean.setContent(content);
	galleryBean.setDate(new Timestamp(System.currentTimeMillis()));
	galleryBean.setIp(request.getRemoteAddr());
	galleryBean.setFirst_image(imgPath);
	
	new GalleryDAO().updateGallery(galleryBean);
	
	response.sendRedirect("content.jsp?num="+num+"&pageNum="+pageNum);
	
	
	


%>	
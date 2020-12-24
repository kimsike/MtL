
<%@page import="galleryComment.GalleryCommentDAO"%>
<%@page import="galleryComment.GalleryCommentBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//작성자 id
	String id = (String)session.getAttribute("id");
	
	if(id == null){
%>
		<script>
			alert("로그인이 필요합니다.");
		
		</script>
<%				
		response.sendRedirect("../member/login.jsp");
		
	}else{
	
	request.setCharacterEncoding("UTF-8");
	
	//글번호
	int content_num = Integer.parseInt(request.getParameter("num"));
	//페이지번호
	String pageNum = request.getParameter("pageNum");
	//댓글내용
	String comment = request.getParameter("comment");
	//작성날짜시간
	Timestamp timestamp = new Timestamp(System.currentTimeMillis());
	//작성자ip
	String ip = request.getRemoteAddr();
	
	GalleryCommentBean gcommentBean = new GalleryCommentBean();
	
	gcommentBean.setContent_num(content_num);
	gcommentBean.setComment(comment);
	gcommentBean.setDate(timestamp);
	gcommentBean.setIp(ip);
	gcommentBean.setId(id);

	GalleryCommentDAO gcommentDAO = new GalleryCommentDAO();
	gcommentDAO.insertComment(gcommentBean);
	
	response.sendRedirect("content.jsp?num="+content_num+"&pageNum="+pageNum);
	
	}
%>
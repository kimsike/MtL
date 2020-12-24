<%@page import="comment.CommentDAO"%>
<%@page import="comment.CommentBean"%>
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
	
	int re_ref = Integer.parseInt(request.getParameter("comment_ref"));
	int re_lev = Integer.parseInt(request.getParameter("comment_lev"));
	int re_seq = Integer.parseInt(request.getParameter("comment_seq"));
	
	CommentBean commentBean = new CommentBean();
	
	commentBean.setContent_num(content_num);
	commentBean.setComment(comment);
	commentBean.setDate(timestamp);
	commentBean.setIp(ip);
	commentBean.setId(id);
	commentBean.setComment_ref(re_ref);
	commentBean.setComment_lev(re_lev);
	commentBean.setComment_seq(re_seq);

	CommentDAO commentDAO = new CommentDAO();
	commentDAO.reInsertComment(commentBean);
	
	response.sendRedirect("content.jsp?num="+content_num+"&pageNum="+pageNum);
	
	}
%>
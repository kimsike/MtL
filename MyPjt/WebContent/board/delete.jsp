<%@page import="board.BoardDAO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.*"%>


<% 	
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String fileName = request.getParameter("fileName");

		new File("c:/test/"+fileName).delete();
		new BoardDAO().deleteContent(num);

		response.sendRedirect("board.jsp?pageNum="+pageNum);
%>


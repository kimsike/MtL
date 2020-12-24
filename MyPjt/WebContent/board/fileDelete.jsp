<%@page import="board.BoardDAO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.*"%>


<% 	
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String fileName = request.getParameter("fileName");
		ServletContext context = getServletContext();
		String savePath = context.getRealPath("/fileUpload");
		new File(savePath+fileName).delete();
		
		new BoardDAO().deleteFile(num);
	
		response.sendRedirect("update.jsp?num="+num+"&pageNum="+pageNum);

%>
	
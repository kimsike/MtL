<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//인코딩
	request.setCharacterEncoding("utf-8");	
%>
	<jsp:useBean id="boardBean" class="board.BoardBean"/>
	<jsp:setProperty property="*" name="boardBean"/>
<%
	String id = (String)session.getAttribute("id");

	if(id == null){
		response.sendRedirect("../member/login.jsp");
	}
	ServletContext context = getServletContext();
	String savePath = context.getRealPath("/fileUpload");
	//String savePath = "c:/test/"; // 저장할 디렉토리 (절대경로)
	int sizeLimit = 10 * 1024 * 1024; // 10메가까지 제한 넘어서면 예외발생
	
	String title = ""; //제목
	String content = ""; //내용
	String fileName = ""; //중복처리됨 이름
	String originalFileName = ""; //중복 처리 전 실제 원본 이름
	long fileSize = 0;
	String fileType = "";
	
	try {
		
		MultipartRequest multi = 
		        new MultipartRequest(request, savePath, sizeLimit, "utf-8",
									 new DefaultFileRenamePolicy());
		Enumeration formNames = multi.getFileNames(); // 폼의 이름 반환
		 
		String formName = (String) formNames.nextElement(); // 자료가 많을 경우엔 while 문을 사용
		fileName = multi.getFilesystemName(formName); //저장된 파일의 이름 얻기
		originalFileName = multi.getOriginalFileName(formName); //원래 이름 가져오기
		title = multi.getParameter("title");
		content = multi.getParameter("content");
		
	} catch(Exception e){
		e.printStackTrace();
	} 
	
	boardBean.setFile(originalFileName); //작성자가 올린 파일이름
	boardBean.setSavedFile(fileName); //저장된 파일이름
	boardBean.setId(id);
	boardBean.setTitle(title);
	boardBean.setContent(content);
	boardBean.setDate(new Timestamp(System.currentTimeMillis()));
	boardBean.setIp(request.getRemoteAddr());
	
	new BoardDAO().insertBoard(boardBean);
	
	response.sendRedirect("board.jsp");
	//response.sendRedirect("content?num="+num+".jsp");
	
%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID CHECK</title>

<script type="text/javascript">
//6.사용함 버튼을 눌렀을 때 호출되는 메소드로 
//  join_IDCheck.jsp(팝업창, 자식창)에 입력되어있는 아이디값을?
//	join.jsp(부모창:자식창을 열게해준 창)의 아이디 입력<input>태그에 넣어주고,
//	팝업창을 닫는 메소드!
function result() {
	//부모창의 아이디 입력하는 곳 input태그의 value속성에 설정 = 
	//자식창 아이디 입력 <input>태그에 value속성값;
	opener.document.fr.idCheck.value = "idCheck";
	opener.document.fr.id.value = document.checkform.userid.value;
	//팝업창 닫기
	window.close();
}

</script>

</head>
<body>
	<%
		String id = request.getParameter("userid");
		
		MemberDAO memberDAO = new MemberDAO();
		int check = memberDAO.idCheck(id);
		
		if(check == 1){
			out.print("사용 중인 아이디입니다.");
		}else{
			out.print("사용 가능한 아이디입니다.");
	%>	
		<input type="button" value="사용하기" onclick="result()">
	<%
		}
	%>

	<form action="register_IDCheck.jsp" method="post" name="checkform">
		아이디 : <input type="text" name="userid" value="<%=id%>">
				<input type="submit" value="중복확인"/>
	
	
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!-- JS 작성을 위해 필요함 -->
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<!-- 로그인 페이지에서 넘겨준 USERID를 받아서 유저 한명에게 넣어줌 -->
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= UTF-8">

<title>JSP 웹사이트</title>
</head>
<body>

	<%
	String userID = null;
	if (session.getAttribute("userID") != null ) {
		userID = (String) session.getAttribute("userID") ;
	}
	if (userID != null ) { 
		 PrintWriter script = response.getWriter();
		   script.println("<script>");
		   script.println("alert('이미 로그인이 되어있습니다.')");
		   script.println("location.href = 'main.jsp'");
		   script.println("</script>");  
	}
	//입력값이 공백일 때
	if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
			|| user.getUserGender() == null || user.getUserEmail() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		if (result == -1) { //아이디 존재
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else //(result ==0) 회원가입 성공!
		{
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
			
		}
	}
	%>


</body>
</html>
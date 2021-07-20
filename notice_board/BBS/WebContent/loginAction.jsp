<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %> <!-- JS 작성을 위해 필요함 -->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "user" class ="user.User" scope = "page" />
<jsp:setProperty name = "user" property="userID" /> <!-- 로그인 페이지에서 넘겨준 USERID를 받아서 유저 한명에게 넣어줌 -->
<jsp:setProperty name = "user" property="userPassword" /> 



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= UTF-8">

<title>JSP 웹 사이트</title>
</head>
<body>
	<% 
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserId(), user.getUserPassword());
		
		if (result == 1 )  { //비밀번호 맞을 때
			PrintWriter script = response.getWriter (); //하나의 스크립트 문장을 넣어줌
			script.println("<script> ");
			script.println("location.href = 'main.jsp' ");
			script.println("location.href = '</script' ");
		}
		else if (result == 0 )  { //비밀번호 틀릴 때 
			PrintWriter script = response.getWriter (); //하나의 스크립트 문장을 넣어줌
			script.println("<script> ");
			script.println("alert('비밀먼호가 틀립니다.') ");
			script.println("history.back() "); //이전 페이지(로그인) 페이지로 돌려놓음
			script.println("location.href = '</script' ");
		}
		
		else if (result == -1 )  { //아이디가 없음
			PrintWriter script = response.getWriter (); //하나의 스크립트 문장을 넣어줌
			script.println("<script> ");
			script.println("alert('존재하지 않는 아이디입니다..') ");
			script.println("history.back() "); //이전 페이지(로그인) 페이지로 돌려놓음
			script.println("location.href = '</script' ");
		}
		
		else if (result == -2 )  { //데이터베이스 오류
			PrintWriter script = response.getWriter (); //하나의 스크립트 문장을 넣어줌
			script.println("<script> ");
			script.println("alert('DB오류가 발생하였습니다.') ");
			script.println("history.back() "); //이전 페이지(로그인) 페이지로 돌려놓음
			script.println("location.href = '</script' ");
		}
	%>
	
</body>
</html>
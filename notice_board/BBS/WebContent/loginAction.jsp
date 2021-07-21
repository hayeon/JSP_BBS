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

<title>JSP 웹사이트</title>
</head>
<body>

	<%
  UserDAO userDAO = new UserDAO();
  int result = userDAO.login(user.getUserID(), user.getUserPassword());
  if(result ==1){
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("location.href = 'main.jsp'");
   script.println("</script>");  
  }
  if(result ==0){
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("alert('비밀번호가 틀립니다')");
   script.println("history.back()");
   script.println("</script>");  
  }
  if(result == -1){
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("alert('존재하지 않는 아이디 입니다.')");
   script.println("history.back()");
   script.println("</script>");  
  }
  
  if(result == -2){
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("alert('데이터 베이스 오류가 발생하였습니다. ')");
   script.println("history.back()");
   script.println("</script>");  
  }
  
 %>


</body>
</html>
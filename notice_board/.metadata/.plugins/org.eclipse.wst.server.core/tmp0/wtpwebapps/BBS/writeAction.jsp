<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "java.io.PrintWriter" %> <!-- JS 작성을 위해 필요함 -->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "bbs" class ="bbs.Bbs" scope = "page" />
<jsp:setProperty name = "bbs" property="bbsTitle" /> <!-- 로그인 페이지에서 넘겨준 USERID를 받아서 유저 한명에게 넣어줌 -->
<jsp:setProperty name = "bbs" property="bbsContent" /> 

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
	if (userID == null ) {  //로그인 안됨
		 PrintWriter script = response.getWriter();
		   script.println("<script>");
		   script.println("alert('로그인을 하세요..')");
		   script.println("location.href = 'login.jsp'");
		   script.println("</script>");
	}
	else {  //입력이 안되었을 때
		if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else { //입력이 됨
			BbsDAO bbsDAO = new BbsDAO();
			int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
			if (result == -1) { //아이디 존재
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글이 등록되었습니다.')");
				script.println("location.href= 'bbs.jsp'");
				script.println("</script>");
		
	}
		}
	
	}
	
	
 %>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= UTF-8">
<meta name="viewport" content="width=device.width" , initial-scale="1">
<!--부트스트랩은 사이즈가 디바이스마다 깔쌈하게 크기가 변경되게 도와줌  -->
<link rel="stylesheet" href="css/bootstrap.css">
<!--스타일시트 참조, css폴더 안에 부트스트랩 참조-->
<title>JSP 웹 사이트</title>
</head>

<body>
	<nav class="navbar navbar-default">
		<!--네이게이션바-->

		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<!--아이콘 바에 작대기 그리기 4개 넣었으니 4줄-->
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

			<a class="navbar-brand" href="main.jsp"> 웹 사이트</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<!--ul은 리스트를 보여줌-->

				<li><a href="main.jsp">메인 </a></li>
				<!-- 메인으로 이동함 -->
				<li><a href="bbs.jsp">게시판 </a></li>
				<!-- 게시판으로 이동함 -->
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="buttton" aria-haspopup="true"
					aria-expanded="false">접속하기 <span class="caret"></span></a>

					<ul class="dropdowon-menu">
						<li class="active"><a href="join.jsp">회원가입</a></li>

						<!-- 액티브는 단 한개의 홈페이지에만 선택된 홈페이지 의미 -->

					</ul></li>
			</ul>
		</div>
	</nav>

	<!-- 로그인 양식 -->

	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4"></div>
		<div class="jumbotron" style="padding-top: 20px;">
			<form method="post" action="loginAction.jsp">
				<!-- post 정보를 숨기면서 보내는 매소드, 로그인액션 페이지로 로그인 정보를 보내주겠다는 뜻 -->

				<h3 style="text-align: center;">로그인 화면</h3>
				<!-- 가운데 정렬-->


				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디"
						name="userID" maxlength="20">
					<!--정보를 넣는 input placeholder는 미입력시 보여지는 것 -->
				</div>

				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호"
						name="userPassword" maxlength="20">
				</div>

				<div class="form-group">
					<input type="submit" class="btn btn-primary form-control"
						value="로그인">
				</div>
			</form>
		</div>
	</div>


	<div class="col-lg-4"></div>


	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	">
	</script>
	<script src="js/bootstrap.js">
		//js폴더 안에 부트스트랩 참조
	</script>
</body>
</html>
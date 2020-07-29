<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="/include/top.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="/main/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="/main/fonts.css" rel="stylesheet" type="text/css" media="all" />

<style>
.loginForm {
 	color: white;
 	margin-top: 200px;
 	height: 400px;
	text-align: center;

}

.loginForm h1 {
	color: white;

}

.loginForm span {

	color: #AD103C;
    font-size: 55px;
}

form {
	padding: 25px;
}


</style>
</head>
<body>


	

<%

	// 로그인 상태유지 쿠키정보 가져오기
	Cookie[] cookies = request.getCookies();

	// name이 "id"인 쿠키객체 찾기
	if (cookies != null) {
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("id")) {
			String id= cookie.getValue();
			
			if(id != null) {
				// 로그인 인증(세션에 id값 추가)
				session.setAttribute("id", id);
				
				
				// id 쿠기와 함께 main.jsp를 요청함
				response.sendRedirect("main.jsp");
				}
			}
		}
	}



%>
<div class="loginForm">
<h1>WELECOME <span>PROPAGANDA</span></h1>
<hr>
<form action="loginPro.jsp" method="post">
	ID: <input type = "text" name= "id"> <br>
	PASSWD : <input type = "password" name = "passwd"><br>
	<br>
	<input type="submit" value="login" >
	<input type= "button" value="join" onclick="location.href='joinForm.jsp'"> 
	<br>
	<input type = "checkBox" name= "keepLogin" value="true">stay logged in
</form>
</div>


</body>
<jsp:include page="/include/bottom.jsp"/>
</html>


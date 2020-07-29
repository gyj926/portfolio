<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
#login
{
	color: lavender;

}


a
{
	text-decoration: none;
	color: white;

}

a:hover 
{
	text-decoration: underline;
}
</style>    

<%
	// 로그인 상태유지 쿠키정보 가져오기
	Cookie[] cookies = request.getCookies();
	// name이 "id"인 쿠키객체 찾기
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("id")) {
				String id = cookie.getValue();
				
				if (id != null) {
					// 로그인 인증(세션에 id값 추가)
					session.setAttribute("id", id);
				}
			}
		}
	}
%>
<%
	// 세션값 가져오기
	String id = (String) session.getAttribute("id");
	// 세션값 있으면 ..님 반가워요~  logout  join없어짐
	// 세션값 없으면  login  join
%>
	<body>
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="#">PROPAGANDA</a></h1>
		</div>
	</div> 
</div>
        <div id="login"> 
        	<%
        	if (id != null) { // 로그인 사용자
        		if (id.equals("admin")) { // 관리자 로그인
        			%>
            		<%=id %>관리자님 어서오세요.<br>
            		<a href="/member/logout.jsp">Logout</a>
            		<a> ㅣ </a>
            		<a href="/member/info.jsp">Info</a>
            		<a> ㅣ </a>
            		<a href="/member/list.jsp">List</a>
            		<% 
        		} else { // 일반사용자 로그인
        			%>
            		<%=id %>님 환영합니다!<br>
            		<a href="/member/logout.jsp">Logout</a>
            		<a> ㅣ </a>
            		<a href="/member/info.jsp">Info</a>
            		<%
        		}
        	} else { // id == null (로그인 안함)
	        	%>
	        	<a href="/member/loginForm.jsp">Login</a>
	        	| <a href="/member/joinForm.jsp">Join</a>
	        	<% 
			}
        	%>
       </div>
       <div id="menu-wrapper">
		<div id="menu" class="container">
			<ul>
				<li class="current_page_item"><a href="/main/main.jsp" accesskey="1" title="">propaganda</a></li>
				<li><a href="/main/flim.jsp" accesskey="2" title="">flim</a></li>
				<li><a href="/main/calligraphy.jsp" accesskey="3" title="">calligraphy</a></li>
				<li><a href="/main/contact.jsp" accesskey="4" title="">contact</a></li>
				<li><a href="/board/board.jsp" accesskey="5" title="">Q&A</a></li>
			</ul>
		</div>
	</div>

	</body>
	



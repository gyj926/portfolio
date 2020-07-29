<%@page import="exam.vo.MemberVo"%>
<%@page import="exam.dao.MemberDao"%>
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
</head>
<style>
h1 
{
	color: antiquewhite;
    text-align: center;
    padding-top: 100px;
}

.info
{
	color: white;
    text-align: inherit;
    padding-left: 837px;
    padding-top: 28px;
    padding-bottom: 47px;
}

h3
{
	font-size: 25px;
    padding-left: 957px;
    text-decoration: none;
}

.buttoni
{
	padding-left: 1044px;
    font-size: 20px;
    text-decoration: none;
    color: slategray;
}
</style>
<body>
<%

	String id = (String) session.getAttribute("id");

	if(id == null) {
		response.sendRedirect("loginForm.jsp");
		return;
	}
	
	MemberDao dao = MemberDao.getInstance();
	
	MemberVo vo = dao.getMemberById(id);

%>

<h1>Member Information</h1>
<hr>
<div class="info">
Id: <%=vo.getId() %><br>
Passwd: <%=vo.getPasswd() %><br>
Name: <%=vo.getName() %><br>
Gender: <%=vo.getGender() %><br>
Tel: <%=vo.getTel() %><br>
Email: <%=vo.getEmail() %><br>
Date: <%=vo.getRegDate() %><br> 
</div>
<a href="update.jsp" class="buttoni">Modify</a>
<a href="deleteForm.jsp" class="buttoni">Delete</a>

<h3><a href='/main/main.jsp'>PROPAGANDA</a></h3>
<jsp:include page="/include/bottom.jsp"/>
</body>
</html>
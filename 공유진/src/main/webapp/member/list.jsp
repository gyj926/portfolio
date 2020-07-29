<%@page import="exam.vo.MemberVo"%>
<%@page import="java.util.List"%>
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
	
	.list
	{
		color: white;
	    text-align: inherit;
	    padding-left: 630px;
	    padding-top: 28px;
	    padding-bottom: 47px;
	}
	
	#main
	{
		padding-left: 1200px;
	}
	
	.infoButton 
	{
		padding-left: 1175px;
  		font-size: 22px;
	
	}
	
	.infoButton a
	{
		color: white;
		text-decoration: none;
		
	}
	
	.infoButton a:hover
	{
		color: antiquewhite;
	}
	
	</style>
<body>
<%


	String id = (String) session.getAttribute("id");

	if( id == null || !id.equals("admin")) {
		response.sendRedirect("/member/list.jsp");
		return;
	}
	
	
	MemberDao dao = MemberDao.getInstance();
	
	List<MemberVo> list = dao.getMembers();
	
	
	
	
%>


	<h1>Member List</h1>
	<hr>
	
	<div class="list">
	<table border="1">
	<tr>
		<th>Id</th>
		<th>Passwd</th>
		<th>Name</th>
		<th>Gender</th>
		<th>Tel</th>
		<th>Email</th>
		<th>RegeDate</th>
	</tr>
	<%
	for (MemberVo vo : list) {
	%>
	<tr>
		<td><%=vo.getId() %></td>
		<td><%=vo.getPasswd() %></td>
		<td><%=vo.getName() %></td>
		<td><%=vo.getGender() %></td>
		<td><%=vo.getTel() %></td>
		<td><%=vo.getEmail() %></td>
		<td><%=vo.getRegDate() %></td>
	</tr>
	<%
	}
	%>
	</table>
	</div>
	
	<div class="infoButton">
	<a href="/admin/adminUpdate.jsp">Modify</a>
	<a>/</a>
	<a href="/admin/adminDelete.jsp">Delete</a>
	</div>
	
	<h3 id="main"><a href="/main/main.jsp">PROPAGANDA</a></h3>
	
	
	</body>
	<jsp:include page="/include/bottom.jsp"/>
	</html>
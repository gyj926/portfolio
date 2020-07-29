<%@page import="exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복체크</title>
<style>
* 
{
	text-align: center;
	margin-top: 20px;
}


</style>
</head>
<body>

<%String id = request.getParameter("id");

MemberDao dao = MemberDao.getInstance(); %>


<form action="join_IDCheck.jsp" method="post" name="cfrm">
	<input type="text" name="id" value="<%=id %>">
	<input type="submit" value="중복확인" >
</form>

<%

	
	if(dao.isIdDuplicated(id)) {
		%>
		<p>사용중인 ID입니다.</p>
		<%
	} else {
		%>
		<p>사용가능한 ID입니다.</p>
		<input type="button" value="사용" onclick="result()">
	 	<%
	}
%>

<script>
	function result() {
		opener.document.frm.id.value = cfrm.id.value;
		close();
	}


</script>
</body>
</html>
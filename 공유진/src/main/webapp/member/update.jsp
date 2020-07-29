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

.updateButton 
{
	margin-left: 230px;
    margin-top: 42px;
}

</style>
<body>
<%
// 세션값 가져오기
	String id = (String) session.getAttribute("id");

	if (id == null) {
		response.sendRedirect("loginForm.jsp");
		return;
	}
	
	MemberDao dao = MemberDao.getInstance();
	
	MemberVo vo = dao.getMemberById(id);
	
	String gender = vo.getGender();
	if(gender == null || gender.equals("")) {
		gender = "남";
	}
%>

<h1>Modify Information</h1>
<hr>

<div class="info">
<form action="updatePro.jsp" method = "post">
	Id: <input type= "text" name="id"  value= "<%=vo.getId() %>" readonly><br>
	Passwd: <input type="password" name="passwd"><br>
	Retype Passwd: <input type="password" name="passwd2"><br>
	Name: <input type="text" name="name"  value= "<%=vo.getName() %>" ><br>
	Gender: <input type="radio" name="gender" value="남" <%if (gender.equals("남")){%> checked <% } %>> 남자
		  	<input type="radio" name="gender" value="여" <%if (gender.equals("여")){%> checked <% } %> > 여자 <br>
	Tel: <input type="text" name="tel" value="<%=vo.getTel() %>"><br>	  	
	Email: <input type="email" name="email" value="<%=vo.getEmail() %>"><br>
		<input type="submit" value="Update" class="updateButton" >
</form>
</div>







</body>
<script>



</script>
<jsp:include page="/include/bottom.jsp"/>
</html>
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

.delete
{
	color: white;
    text-align: inherit;
    padding-left: 837px;
    padding-top: 28px;
    padding-bottom: 47px;
}

.buttonD
{
	margin-left: 239px;
    margin-top: 17px;
}



</style>
<body>
<%
	
	String id = (String) session.getAttribute("id");

	if (id == null) {
		response.sendRedirect("loginForm.jsp");
		return;
	}
%>

<h1>Membership Withdrawal</h1>
<hr>
<div class="delete">
<form name="frm" action="deletePro.jsp" method="post" onsubmit="return check()">
Id: <input type="text" name="id" value="<%=id %>" readonly><br>
Passwd: <input type="password" name="passwd"><br> 
 <input type="button" value="delete" class="buttonD" onclick="check2()">
</form>
</div>


<script>

function check() {
	var result = confirm('정말 삭제하시겠습니까?');
	
	if(result == false) {
		return false;
	}
}


function check2() {
	var result = confirm('정말 삭제하시겠습니까?');
	
	if(result == false) {
		return;
	}
	frm.submit();
}

</script>



</body>
<jsp:include page="/include/bottom.jsp"/>
</html>
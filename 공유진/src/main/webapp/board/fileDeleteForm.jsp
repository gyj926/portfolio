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
h1
{
	color: antiquewhite;
    font-size: 35px;
    padding-left: 800px;
    padding-top: 50px;
}

form 
{
  	color: cadetblue;
    padding-left: 783px;
    padding-top: 108px;
    padding-bottom: 390px;
}
</style>
</head>
<body>
<%
	// int num, String pageNum  파라미터 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>
	<h1>게시판 글 삭제</h1>
	<hr>
	
	<form action="fileDeletePro.jsp" method="post">
		<input type="hidden" name="pageNum" value="<%=pageNum %>">
		<input type="hidden" name="num" value="<%=num %>">
		<table border="1">
			<tr>
				<th>password</th>
				<td><input type="password" name="passwd"></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="submit" value="글삭제">
					<input type="button" value="글목록" onclick="location.href='board.jsp?pageNum=<%=pageNum %>'">
				</td>
			</tr>
			
		</table>
	</form>
</body>
<jsp:include page="/include/bottom.jsp"/>
</html>






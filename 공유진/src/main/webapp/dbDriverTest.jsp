<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>연동 테슽흐</h1>

<%
Class.forName("com.mysql.cj.jdbc.Driver");


Connection con = DriverManager.getConnection(
	"jdbc:mysql://localhost:3306/jspdb?useUnicode=true&characterEncoding=utf8&allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=Asia/Seoul",
	"jspuser",
	"jsppass"
		
		); 

%>
DB 연결됨! <br>

</body>
</html>
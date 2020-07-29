<%@page import="exam.dao.MemberDao"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="vo" class="exam.vo.MemberVo"/>

<jsp:setProperty property="*" name="vo"/>

<%LocalDateTime dateTime = LocalDateTime.now();%>

<%vo.setRegDate(LocalDateTime.now()); %> 

<%MemberDao dao = MemberDao.getInstance();%>

<%dao.insert(vo); %>


<% response.sendRedirect("/main/main.jsp"); %>

<script>
	
	alert('회원가입이 완료되었습니다.')
	location.href = 'login.jsp';
	

</script>
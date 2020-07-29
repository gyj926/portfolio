<%@page import="exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	// id passwd 파라미터 가져오기
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	// DB객체 준비
	MemberDao dao = MemberDao.getInstance();
	
	// -1: 아이디 없음, 0: 비밀번호 틀림, 1: 아이디 비밀번호 일치
	int check = dao.userCheck(id, passwd);
	
	if(check == 1) {
		session.setAttribute("id", id);
		response.sendRedirect("/main/main.jsp");
	} else if (check == 0) {
		%>
		<script>
		alert('비밀번호가 일치하지 않습니다.');
		history.back();	
		</script>
		<%	
	} else { // check == -1
		%>
		<script>
			alert('존재하지 않는 아이디입니다.');
			history.back();
		</script>
		<%
	}






%>
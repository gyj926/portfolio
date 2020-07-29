<%@page import="exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%

	String id = (String) session.getAttribute("id");
	
	if (id==null) {
		response.sendRedirect("loginForm.jsp");
		return;
	}
	
	// "passwd" 파라미터 가져옴
	String passwd = request.getParameter("passwd");
	
	// DB객체 가져오기
	MemberDao dao = MemberDao.getInstance();
	
	// -1 : 아이디없음  
	//  0 : 비밀번호 틀림
	//  1 : 아이디 비밀번호 일치
	int check = dao.userCheck(id, passwd);
	
	
	if (check == 1) {
		// 테이블에서 삭제
		dao.deleteById(id);
		
		// 로그아웃 처리
		session.invalidate();
		
		%>
		<script>
			alert('회원삭제 완료');
			location.href = '/main/main.jsp';
		</script>
		<%
	} else if (check == 0) {
		%>
		<script>
		alert('비밀번호가 틀렸습니다.');
		history.back();
		</script>
		<%
	}
	
	System.out.println(dao);
	%>

	



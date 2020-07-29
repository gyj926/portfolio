<%@page import="exam.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	String[] ids = request.getParameterValues("deleteId");
	
	MemberDao dao = MemberDao.getInstance();
	
	for (String id : ids) {
		dao.deleteById(id);
	}
	
	
%>

	<script>
		alert('회원삭제 완료');
		location.href = '/admin/adminDelete.jsp';
	</script>
		

































%>
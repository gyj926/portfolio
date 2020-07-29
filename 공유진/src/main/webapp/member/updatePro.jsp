<%@page import="exam.dao.MemberDao"%>
<%@page import="exam.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
    
    String id = (String) session.getAttribute("id");

	if (id == null) {
		response.sendRedirect("loginForm.jsp");
		return;
	}
	
	request.setCharacterEncoding("utf-8");
	
	MemberVo vo = new MemberVo();
	
	vo.setId(request.getParameter("id"));
	vo.setPasswd(request.getParameter("passwd"));
	vo.setName(request.getParameter("name"));
	vo.setGender(request.getParameter("gender"));
	vo.setTel(request.getParameter("tel"));
	vo.setEmail(request.getParameter("email"));
	

	System.out.println(vo);
	
	MemberDao dao = MemberDao.getInstance();
	
	int rowCount = dao.update(vo);
	
	if(rowCount > 0) {
		%>
		<script>
			alert('내정보가 수정되었습니다.');
			location.href = '/main/main.jsp'
		</script>
		<%
	} else {
		%>
		<script>
			alert('다시 시도해주세요.');
			history.back();
		</script>
		<%
	}
    
   

%>
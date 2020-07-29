<%@page import="exam.dao.BoardDao"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<jsp:include page="/include/top.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="/main/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="/main/fonts.css" rel="stylesheet" type="text/css" media="all" />
</head>

<%

	// post 파라미터 한글처리
	request.setCharacterEncoding("utf-8");

	// pageNum 파라미터 가져오기
	String pageNum = request.getParameter("pageNum");
%>

<jsp:useBean id="vo" class="exam.vo.BoardVo"/>
<jsp:setProperty property="*" name="vo"/>

<%
	// ip주소 regDate 설정
	vo.setIp(request.getRemoteAddr());
	vo.setRegDate(LocalDateTime.now());
	
	// DB객체 가져오기
	BoardDao dao = BoardDao.getInstance();
	
	// 새 글 번호 구하기
	int num = dao.getBoardNum();
	
	// 새 글 번호를 답글번호로 설정
	vo.setNum(num);
	
	 
	/* vo객체에 담겨있는 답글을 다는 대상글의
	reRef, reLev, reSeq를 기준으로 답글쓰기
	트랜잭션(한개의 단위작업) 처리 */

	// 답글 insert
	dao.replyInsert(vo);

	// 이동 notice.jsp
	response.sendRedirect("board.jsp?pageNum=" + pageNum);


%>


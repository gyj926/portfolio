<%@page import="exam.vo.AttachfileVo"%>
<%@page import="java.util.List"%>
<%@page import="exam.vo.BoardVo"%>
<%@page import="exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	//세션값 가져오기
	String id = (String) session.getAttribute("id");
	// 세션값 없으면 login.jsp로 이동
	if (id == null) {
		%>
		<script>
			alert('해당 게시물은 로그인 후 이용할 수 있습니다.');
			location.href = '/member/loginForm.jsp';
		</script>
		<%
		return;
	}
%>

<head>
<jsp:include page="/include/top.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="/main/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="/main/fonts.css" rel="stylesheet" type="text/css" media="all" />
<style>
#notice
{
	color: white;
	font-size: 20px;
	padding-left: 660px;
}

h1
{
	color: antiquewhite;
    font-size: 50px;
    padding-left: 566px;
}

#table_search
{
	padding-left: 1057px;
    padding-top: 50px;
}

</style>
</head>
<%
	// int num   String pageNum  파라미터 가져오기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	// DB객체 가져오기
	BoardDao dao = BoardDao.getInstance();
	
	// 글 한개 가져오기
	BoardVo vo = dao.getBoardByNum(num);

	// 조회수 1 증가
	dao.updateReadCount(num);
	
	// 첨부파일 리스트 가져오기
	List<AttachfileVo> attachList = vo.getAttachList();
	
	// 내용에서 엔터키 줄바꿈 : \r\n -> <br> 바꾸기
	String content = "";
	if(vo.getContent()!=null) {
		content = vo.getContent().replaceAll("\r\n", "<br>");
	}
%>
<body>
<div id="wrap">
	
	<article>
		
	<h1>Content</h1>
	<hr>	
	<table id="notice">
		<tr>
			<th scope="col" width="140">글번호</th>
			<td width="500" style="text-align: left;"><%=vo.getNum() %></td>
		</tr>
		<tr>
			<th scope="col">조회수</th>
			<td style="text-align: left;"><%=vo.getReadcount() %></td>
		</tr>
		<tr>
			<th scope="col">작성자</th>
			<td style="text-align: left;"><%=vo.getName() %></td>
		</tr>
		<tr>
			<th scope="col">작성일</th>
			<td style="text-align: left;"><%=vo.getRegDate() %></td>
		</tr>
		<tr>
			<th scope="col">글제목</th>
			<td style="text-align: left;"><%=vo.getSubject() %></td>
		</tr>
		<tr>
			<th scope="col">파일</th>
			<td style="text-align: left;">
			<%
			if (attachList != null ) {
			for (AttachfileVo attachVo : attachList) {
				%>
				<a href="download.jsp?uuid=<%=attachVo.getUuid() %>">
				<%=attachVo.getFilename() %><br>
				</a>
				<%
				}
			}
			%>
			</td>
		</tr>
		<tr>
			<th scope="col">글내용</th>
			<td style="text-align: left;">
			<textarea rows="13" cols="40" name="content" readonly><%=content %></textarea>
			</td>
		</tr>
	</table>

		
		

	<div id="table_search">
		<button onclick="location.href='fileModifyForm.jsp?pageNum=<%=pageNum %>&num=<%=vo.getNum() %>'">글수정</button>
		<button onclick="location.href='fileDeleteForm.jsp?pageNum=<%=pageNum %>&num=<%=vo.getNum() %>'">글삭제</button>
		<button type="button" onclick="location.href='replyWriteForm.jsp?reRef=<%=vo.getReRef() %>&reLev=<%=vo.getReLev() %>&reSeq=<%=vo.getReSeq() %>&pageNum=<%=pageNum %>'">답글쓰기</button>
		<button type="button" onclick="location.href='board.jsp?pageNum=<%=pageNum %>'">글목록</button>
	</div>
	
	<div class="clear"></div>
	<div id="page_control">
	</div>
		
	</article>
	</div>

</body>
<jsp:include page="/include/bottom.jsp"/>
</html>
<%@page import="exam.dao.BoardDao"%>
<%@page import="java.time.LocalDateTime"%>
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
    padding-top: 100px;
    padding-left: 520px;
    font-size: 31px;
}

*
{
	color: cadetblue;
}

form
{
    padding-left: 670px;
    padding-top: 20px;
}

#table_search
{
	padding-left: 442px;
}

</style>
</head>
<%

// 세션값 가져오기
String id = (String) session.getAttribute("id");
// 세션값 없으면 login.jsp로 이동
if (id == null) {
	response.sendRedirect("/member/loginForm.jsp");
	return;
}


	String pageNum = request.getParameter("pageNum");
	String reRef = request.getParameter("reRef");
	String reLev = request.getParameter("reLev");
	String reSeq = request.getParameter("reSeq");
	;
%>
<body>
<div id="wrap">
	<article>
		
	<h1>답글작성</h1>
	<hr>
	
	<form action="replyWritePro.jsp" method="post" name="frm" onsubmit="return check2()">
	<input type="hidden" name="reRef" value="<%=reRef %>">
	<input type="hidden" name="reLev" value="<%=reLev %>">
	<input type="hidden" name="reSeq" value="<%=reSeq %>">
	<input type="hidden" name="pageNum" value="<%=pageNum %>">
	
	<table id="notice">
	<tr>
			<th scope="col" width="100">아이디</th>
			<td style="text-align: left; width: 500px;">
				<input type="text" name="id" value="<%=id %>" readonly>
			</td>
		</tr>
		<tr>
			<th scope="col">비밀번호</th>
			<td style="text-align: left;">
				<input type="password" name="passwd">
			</td>
		</tr>
		<tr>
			<th scope="col">글제목</th>
			<td style="text-align: left;">
				<input type="text" name="subject" value="[RE:]">
			</td>
		</tr>
		<tr>
			<th scope="col">글내용</th>
			<td style="text-align: left;">
				<textarea rows="13" cols="40" name="content"></textarea>
			</td>
		</tr>
	</table>
	
		
	<div id="table_search">
		<button type="button" onclick="check2()">글쓰기</button>
		<button type="reset">다시쓰기</button>
		<button type="button" onclick="location.href='board.jsp?pageNum=<%=pageNum %>'">목록보기</button>
	</div>
	</form>
	
	<div class="clear"></div>
	<div id="page_control">
	</div>
		
	</article>
    
	<div class="clear"></div>
	<%-- footer 영역  include bottom.jsp --%>
	<jsp:include page="/include/bottom.jsp"/>
</div>

<script>

function check2() {
	
	if(document.frm.subject.value=="") {
		alert('제목을 입력해주세요')
		document.frm.subject.focus();
		return;
	}
	
	if(document.frm.content.value=="") {
		alert('내용을 입력해주세요')
		document.frm.content.focus();
		return;
	}
		document.frm.submit();
	
}

</script>
</body>
</html>   

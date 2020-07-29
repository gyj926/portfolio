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

*
{
	color: cadetblue;
}

.form
{
	padding-left: 675px;
    padding-top: 45px;
}

h1
{
	color: antiquewhite;
	font-size: 31px;
}

#table_search
{
	padding-left: 441px;
}

button #btnAddFile
{
	color: black;
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
%>

<body onLoad="frm.passwd.focus()">
<div id="wrap">


	<article class="form">
		
	<h1>글작성</h1>
	
	
	<form action="writePro.jsp" method="post" name="frm">
	<table id="notice">
		<tr>
			<th scope="col" width="100">아이디</th>
			<td style="text-align: left; width: 500px;">
				<input type="text" name="id" value="<%=id %>" readonly>
			</td>
		</tr>
		<tr>
			<th scope="col" width="100">비밀번호</th>
			<td style="text-align: left; width: 500px;">
				<input type="password" name="passwd">
			</td>
		</tr>
		<tr>
			<th scope="col">글제목</th>
			<td style="text-align: left;">
				<input type="text" name="subject">
			</td>
		</tr>
		<tr>
			<th scope="col">파일</th>
			<td style="text-align: left;">
				<button type="button" id="btnAddFile">첨부파일 추가</button>
				<div id="fileBox">
					<div>
						<input type="file" name="filename">
						<span class="fileDelete">X</span>
					</div>
				</div>
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
		
	if(document.frm.passwd.value == "") {
		alert('비밀번호를 입력해주세요');
		document.frm.passwd.focus();
		return;
	}	
	
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
<jsp:include page="/include/bottom.jsp"/>
</html>
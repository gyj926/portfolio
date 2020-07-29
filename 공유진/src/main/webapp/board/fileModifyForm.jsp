<%@page import="exam.vo.BoardVo"%>
<%@page import="exam.vo.AttachfileVo"%>
<%@page import="java.util.List"%>
<%@page import="exam.dao.BoardDao"%>
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
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1
{
	font-size: 35px;
    color: antiquewhite;
    padding-left: 500px;
    padding-top: 43px;
}

form 
{
    padding-left: 660px;
    padding-top: 30px;
}

*
{
	color: cadetblue;
}

#table_search
{
    padding-left: 455px;
}
</style>
</head>
<%
	// 세션 값 가져오기
	String id = (String) session.getAttribute("id");

	// 세션값 없으면 로그인 화면으로 이동
	if (id == null) {
		response.sendRedirect("/member/loginForm.jsp");
		return;
	}
	
	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	
	BoardDao boardDao = BoardDao.getInstance();
	
	BoardVo boardVo = boardDao.getBoardAndAttachfilesByNum(num);
	List<AttachfileVo> attachList = boardVo.getAttachList();

%>
<body>
<div id="wrap">
	<article>
		
	<h1>게시판 글수정</h1>
	<hr>
	
	<form action="fileModifyPro.jsp" method="post" name="frm">
	<input type="hidden" name="num" value="<%=num %>">
	<input type="hidden" name="pageNum" value="<%=pageNum %>">
	<table id="notice">
		<tr>
			<th scope="col" width="100">아이디</th>
			<td style="text-align: left; width: 500px;">
				<input type="text" name="name" value="<%=id %>" readonly>
			</td>
		</tr>
		<tr>
			<th scope="col">글제목</th>
			<td style="text-align: left;">
				<input type="text" name="subject" value="<%=boardVo.getSubject() %>">
			</td>
		</tr>
		<tr>
			<th scope="col">파일</th>
			<td style="text-align: left;">
				<button type="button" id="btnAddFile">첨부파일 추가</button>
				<div id="fileBox">
					<div id="oldFileBox">
						<%
						for (AttachfileVo attachVo : attachList) {
							%>
							<input type="hidden" name="oldfile" value="<%=attachVo.getUuid() %>">
							<div>
								<%=attachVo.getFilename() %>
								<span class="delete-oldfile">X</span>
							</div>
							<%
						}
						%>
					</div>
				
					<div id="newFileBox"></div>
				</div>
			</td>
		</tr>
		<tr>
			<th scope="col">글내용</th>
			<td style="text-align: left;">
				<textarea rows="13" cols="40" name="content"><%=boardVo.getContent() %></textarea>
			</td>
		</tr>
	</table>

	<div id="table_search">
		<button type="submit" value="글수정">글수정</button>
		<button type="reset">다시쓰기</button>
		<input type="button" value="글목록" onclick="location.href='board.jsp?pageNum=<%=pageNum %>'">
	</div>
	</form>
	
	<div class="clear"></div>
	<div id="page_control">
	</div>
		
	</article>
	
</div>
<script src="/script/jquery-3.5.1.js"></script>
<script>
var fileCount = <%=attachList.size() %>;

// 정적 이벤트 바인딩
$('button#btnAddFile').click(function (event) {
	if (fileCount >= 3) {
		alert('첨부파일은 최대 3개까지만 가능합니다.');
		return;
	}
	
	var str = '<div><input type="file" name="filename"><span class="delete-addfile">X</span></div>';
	
	//$(this).next().find('div#newFileBox').append(str);
	$('div#newFileBox').append(str);
	fileCount++;
});

// 동적 이벤트 바인딩
$('div#newFileBox').on('click', 'span.delete-addfile', function (event) {
	$(this).parent().remove(); // empty()는 안쪽요소만 비움
	fileCount--;
});

// 정적 이벤트 바인딩
$('span.delete-oldfile').click(function () {
	$(this).parent().prev().prop('name', 'delfile');
	$(this).parent().remove();
	fileCount--;
});


</script>

</body>
<jsp:include page="/include/bottom.jsp"/>
</html>
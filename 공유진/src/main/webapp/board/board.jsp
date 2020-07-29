<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="exam.vo.BoardVo"%>
<%@page import="java.util.List"%>
<%@page import="exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="/main/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="/main/fonts.css" rel="stylesheet" type="text/css" media="all" />

<%-- head 영역  include head.jsp --%>
<style>
*
{
	color: white;
	
}

h1
{
	color: white;
    font-size: 50px;
    text-align: left;
    padding-left: 544px;
}

.box
{
	background-color: teal;
    width: 12px;
    height: 58px;
    margin-left: 524px;
    margin-top: -97px;
}

span
{
	font-size: 25px;
}

#notice
{
	font-size: 18px;
    padding-top: 34px;
    height: 500px;
    width: 700px;
    margin-left: 635px;
    cursor: pointer;
}

#table_search .category
{
	background-color: darkcyan;
    width: 63px;
    height: 100%;
    padding-bottom: 4px;
    padding-top: 3px;
    padding-left: 6px;
    padding-right: 3px;
    margin-left: 707px;
    margin-top: 17px;
    margin-bottom: -31px;
    cursor: pointer;

}

#table_search .btn
{
	color: white;
    background-color: darkcyan;
    padding-left: 10px;
    padding-right: 10px;
    padding-top: 4px;
    padding-bottom: 4px;
    font-size: 15px;
    cursor: pointer;
}

#table_search .table
{
	padding-left: 120px;
	cursor: pointer;
}
.btnW
{
	margin-left: 1248px;
    margin-bottom: -27px;
    font-size: 16px;
    background-color: black;

}

.search
{
	padding-left: 772px;
}

#notice tr
{
	text-align: justify;
}

.pageNum
{
	display: contents;
	
    
}

input.input_box
{
	color: black;
}

.search_box
{
	padding-left: 876px;
}

</style>
</head>
<%
	//검색어 관련 파라미터 가져오기. 없으면 null 리턴
	String category = request.getParameter("category"); // 검색유형
	String search = request.getParameter("search"); // 검색어
	category = (category == null) ? "" : category;
	search = (search == null) ? "" : search;
	
	System.out.println("category = " + category);
	System.out.println("search = " + search);
	
	BoardDao dao = BoardDao.getInstance();
	// 전체 글갯수
	int totalCount = dao.getTotalCount(category, search);
	
	//사용자가 요청한 페이지번호 파라미터 가져오기
	String strPageNum = request.getParameter("pageNum");
	if (strPageNum == null || strPageNum.equals("")) {
		strPageNum = "1";
	}

	// 문자열 페이지번호를 숫자로 변환
	int pageNum = Integer.parseInt(strPageNum);

	// 한 페이지에 10개씩 가져오기
	int pageSize = 10;
	
	// 시작행 인덱스번호 구하기(수식)
	int startRow = (pageNum-1) * pageSize;

	// 원하는 페이지의 글을 가져오는 메소드
	List<BoardVo> list = null;
	if(totalCount > 0) {
		list = dao.getBoards(startRow, pageSize, category, search);
	}


%>


<body>
<jsp:include page="/include/top.jsp"/>
<div id="table"></div>

<article>
<h1> Q&A <span>[Total: <%=totalCount %>]</span></h1>
<div class="box"></div>
<input type="button" value="글쓰기" class="btnW" onclick="location.href='writeForm.jsp?pageNum=<%=pageNum %>'">

<table id="notice">
	<tr>
		<th scope="col" class="tno">no.</th>
		<th scope="col" class="ttitle">title</th>
		<th scope="col" class="twrite">writer</th>
		<th scope="col" class="tdate">date</th>
		<th scope="col" class="tread">read</th>
	</tr>
	<%
	if(totalCount > 0) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
		
		for (BoardVo vo : list) {
			LocalDateTime dateTime = vo.getRegDate();
			String strRegDate = dateTime.format(formatter);
			%>
			<tr onclick="location.href='content.jsp?num=<%=vo.getNum() %>&pageNum=<%=pageNum %>'">
				<td><%=vo.getNum() %></td>
				<td class="left">
					<%
					if (vo.getReLev() > 0) {
						%>
						<img src="/images/level.gif" width="<%=vo.getReLev() * 10 %>" height="13">
						<img src="/images/re.gif">
						<%
					}
					%>
					<%=vo.getSubject() %>
				</td>
				<td><%=vo.getName() %></td>
				<td><%=strRegDate %></td>
				<td><%=vo.getReadcount() %></td>
			</tr>
				<%
			}
		} else {
			%>
			<tr>
				<td colspan="5">게시판 글없음</td>
			</tr>
			<%
		}
		%>
	</table>
	<div id="table_search">
		<form action="/board/board.jsp" method="get" class="table">
		<select name ="category" class="category">
			<option value="content" <% if (category.equals("content")) { %>selected<% } %>>글내용</option>
	<option value="subject" <% if (category.equals("subject")) { %>selected<%} %>>글제목</option>
			<option value="name" <% if (category.equals("name")) { %>selected<%} %>>작성자</option>
		</select>
		<div class="search">
		<input type="text" name="search" class="input_box"> 
		<input type="submit" value="검색" class="btn">
		</div>
		</form>
		
	</div>

<div class="search_box">
<%

	// 총 페이지 수 구하기
	if (totalCount > 0) {
		int pageCount = totalCount / pageSize;
		if (totalCount % pageSize > 0) {
			pageCount += 1;
		}
		
		// 페이지번호 갯수 설정
		int pageBlock = 5;
			
		// 페이지 블록 시작페이지
		int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
		
		// 페이지 블록 끝페이지
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		
			// [이전]
			if (startPage > pageBlock) {
				%>
				<a href="board.jsp?pageNum=<%=startPage - pageBlock %>&category=<%=category %>&search=<%=search %>">[이전]</a>
				<%
			}
					
			
			// 페이지블록 내에서의 시작페이지부터 끝페이지까지 번호출력
			for (int i=startPage; i<=endPage; i++) {
				%>
				<a href="board.jsp?pageNum=<%=i %>">				
				<%
				if (i == pageNum) {
					%>
					<span style="font-weight: bold; color: cadetblue;">[<%=i %>]</span>
					<%
				} else {
					%>
					[<%=i %>]
					<%
				}
				%>
				</a>
				<%
			}
			
			// [다음]
			if (endPage < pageCount) {
				%>
				<a href="board.jsp?pageNum=<%=startPage + pageBlock %>">[다음]</a>
				<%
			}
		
	} // if
%>
</div>



</article>
<%-- footer 영역  include bottom.jsp --%>
<jsp:include page="/include/bottom.jsp"/>
	</body>
</html> 
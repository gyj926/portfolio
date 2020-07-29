<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : Picturesque 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20131223

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="/main/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="/main/fonts.css" rel="stylesheet" type="text/css" media="all" />

<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecoed.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>"
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->

<!--[if IE 6]>
<script src="../script/DD_belatedPNG.js"></script>
<script>
/* EXAMPLE */
DD_belatedPNG.fix('#wrap');
DD_belatedPNG.fix('#sub_img');
DD_belatedPNG.fix('#sub_img_center');
DD_belatedPNG.fix('#sub_img_member');

</script>
<![endif]-->


</head>
<body>
<!-- <div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="/main/main.jsp">PROPAGANDA</a></h1>
		</div> -->
		<%-- header 영역  include top.jsp --%>
		<jsp:include page="/include/top.jsp" />

	<!-- <div id="menu-wrapper">
		<div id="menu" class="container">
			<ul>
				<li class="current_page_item"><a href="/main/main.jsp" accesskey="1" title="">propaganda</a></li>
				<li><a href="/main/flim.jsp" accesskey="2" title="">flim</a></li>
				<li><a href="/main/calligraphy.jsp" accesskey="3" title="">calligraphy</a></li>
				<li><a href="/main/contact.jsp" accesskey="4" title="">contact</a></li>
				<li><a href="/board/board.jsp" accesskey="5" title="">board</a></li>
			</ul>
		</div>
	</div>
</div> -->
<div id= "banner"></div>
<div id="wrapper2">
	<div id="portfolio" class="container">
		<div class="title">
			<h2>Film</h2>
			<span class="byline"><a href="https://www.instagram.com/propagandacinemastore/">@Propagandacinemastore</a></span>
		</div>
		<div class="column1">
			<div class="box"> <a href="#"><img src="/images/호크니.jpg" alt="" class="image image-full" /></a>
				<h3></h3>
				<p></p>
				 </div>
		</div>
		<div class="column2">
			<div class="box"> <a href="#"><img src="/images/안녕미누.jpg" alt="" class="image image-full" /></a>
				<h3></h3>
				<p></p>
				</div>
		</div>
		<div class="column3">
			<div class="box"> <a href="#"><img src="/images/침입자.jpg" alt="" class="image image-full" /></a>
				<h3></h3>
				<p></p>
				</div>
		</div>
		<div class="column4">
			<div class="box"> <a href="#"><img src="/images/잡식가족의딜레마.jpg" alt="" class="image image-full" /></a>
				<h3></h3>
				<p></p>
				<a href="flim.jsp" class="button button-small">Learn More</a> </div>
		</div>
	</div>
</div>
<div class="wrapper">
	<div id="three-column" class="container">
	<div class="title">
	<h2>Calligraphy</h2>
	<div id="Calligraphy">
		<div id="tbox1">
			<div class="title">
			<a href="/main/calligraphy.jsp"><img src="/images/캘리1.jpg" class="image image-full2" /></a>
				<h2></h2>
				<span class="byline"></span>
			</div>
			</div>
		<div id="tbox2">
			<div class="title">
			<a href="/main/calligraphy.jsp"><img src="/images/캘리3.jpg" class="image image-full2" /></a>
				<h2></h2>
				<span class="byline"></span>
			</div>
			</div>
		<div id="tbox3">
			<div class="title">
			<a href="/main/calligraphy.jsp"><img src="/images/캘리4.jpg" class="image image-full2" /></a>
				<h2></h2>
				<span class="byline"></span>
			</div>
		</div>
	</div>
			<a href="calligraphy.jsp" class="button2 button-small">Learn More</a></div>
	</div>
	</div>
<div id="page-wrapper">
	<div id="page" class="container">
		<div class="title">
			<h2>Welcome to PROPAGANDA</h2>
		</div>
		<p><strong><a href="index.html">PROPAGANDA</a></strong>  IS A DESIGN STUDIO IN THE ENTERTAINMENT FIELD SPECIALIZING IN FILM, THEATER AND CALLIGRAPHY.
PROPAGANDA DESIGNS OUT OF OWN CREATIVE PASSION TO THE SATISFACTION OF OUR CLIENTS. </p>
	</div>
</div>
<div id="copyright" class="container">
	<p>&copy; Untitled. All rights reserved. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
		
</div>
</body>
</html>

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
</head>

<style>
.joinForm {
 	color: white;
 	margin-top: 200px;
 	height: 400px;
	text-align: center;

}

form {
	padding: 20px;
}

.joinForm h1{
	color: #AD103C;
    font-size: 45px;
}
</style>


<body onLoad="frm.id.focus()">

<div class="joinForm">
<hr>
<h1>JOIN US</h1>


<fieldset>

<form action="joinPro.jsp" method="post" name="frm">
	User ID: <input type="text" name="id">
			 <input type="button" value="중복확인" class="dup" onclick="winopen()">
			 <%-- <span id=idDupMessage></span><br> --%> <br>
	Passwd: <input id="passwd" type="password" name="passwd"><br>
	Retype Passwd: <input id="passwd2" type="password" name="passwd2">
	<span id = "passwdMessage"></span>
	<br>
	Name: <input type="text" name="name"><br>
	Gender: <input type="radio" name="gender" value="남" > male
		  <input type="radio" name="gender" value="여" > female <br>
	tel: <input type="text" name="tel"><br>	  
	Email: <input type="email" name="email"><br>
	
	<input type="submit" value="회원가입">
	<input type="button" value="취소" onclick="gologinForm()">
</form>
</fieldset>
</div>

<jsp:include page="/include/bottom.jsp"/>


<script src="/script/jquery-3.5.1.js"></script>
<script>


function gologinForm() {
    location.href="/main/main.jsp";
}

function winopen() {
	var id = document.frm.id.value;
	console.log('id = ' + id);
	
	if (id=='') {
		alert('아이디를 입력하세요');
		document.frm.id.focus();
		return;
	}
	open('join_IDCheck.jsp?id=' + id, 'dupCheck', 'width=500,height=300');
}

	$('input[name="id"]').keyup(function(event) {
		var id = $(this).val();
		
		$.ajax({
			
			url: '/ajax/ajax_join_IDCheck.jsp',
			data: {id: id},
			success: function(data) {
			console.log(data.isIdDup);
			console.log(data.name);
			console.log(data.age);
			
			showIdDupMessage(data);
		}
		});
		
	});
	
/* 	
	function showIdDupMessage(data) {
		if(data.isIdDup) {
			$('span#idDupMessage').html('이미 사용중인 ID 입니다.').css('color','red');
		} else {
			$('span#idDupMessage').html('사용 가능한 ID 입니다.').css('color','green');
		}
	}
 */

	// 문서객체(document)
// 	$('#passwd2').keyup(function () {
// 		console.log('키 눌렀다 떼어짐');
		
// 		if ($('#passwd').val() != $(this).val()) {
// 			$('#passwdMessage').html('패스워드가 불일치합니다.');
// 		} else {
// 			$('#passwdMessage').html('패스워드 일치합니다.');
// 		}
// 	});
	
	var passwd  = document.getElementById('passwd');
	var passwd2 = document.getElementById('passwd2');
	var spanMessage  = document.getElementById('passwdMessage');
	
	passwd2.onkeyup = function() {

		console.log('키 눌렀다 떼어짐');
		
		if (passwd.value != passwd2.value) {
			spanMessage.innerHTML = '패스워드가 불일치합니다.';
		} else {
			spanMessage.innerHTML = '패스워드 일치합니다.';
		}
	};
	
	
	
</script>
</body>
</html>
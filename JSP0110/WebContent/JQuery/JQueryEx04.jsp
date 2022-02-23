<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 다운 받지 않고 사용하려면 CDN을 이용하면 된다. -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("*").css('color','red'); // 전체 선택자(*) : 모든 글자를 빨간색으로  
		$("h2").css('background-color', 'pink'); // 태그 선택자 (태그명)
		$("h1,h3").css('background-color', 'skyblue'); // 태그 선택자 (태그명,태그명..)
		$("#box1").css('color','green'); // ID선택자 ("#아이디명")
		$("#box3,#box5").css('color','blue'); // ID선택자 ("#아이디명,...")
		$(".block1").css('background-color','silver'); // 클래스선택자(".클래스이름")
		$(".block2,.block3")
		.css('background-color','yellow')
		.css('font-size','18pt')
		.css('font-weight','bold'); // 클래스선택자(".클래스이름,...")
	});

</script>
<style type="text/css">
	* {color: blue;}
</style>
</head>
<body>
	<h1>Hello JQuery!!!!</h1>
	<h2>Hello JQuery!!!!</h2>
	<h3>Hello JQuery!!!!</h3>
	<!-- 
	span[class="block$"]{내용 $$}*5
	-->
	<span class="block1">내용 01</span>
	<span class="block2">내용 02</span>
	<span class="block1">내용 03</span>
	<span class="block2">내용 04</span>
	<span class="block1">내용 05</span>
	<span class="block3">내용 06</span>
	
	<!-- 
	div[id='box$']{$$. 나는 내용입니다.}*5
	 -->
	<div id="box1">01. 나는 내용입니다.</div>
	<div id="box2">02. 나는 내용입니다.</div>
	<div id="box3">03. 나는 내용입니다.</div>
	<div id="box4">04. 나는 내용입니다.</div>
	<div id="box5">05. 나는 내용입니다.</div>
	
</body>
</html>
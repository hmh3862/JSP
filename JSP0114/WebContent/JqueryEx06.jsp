<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 객체 이벤트 연결(toggle, hover)</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("button").click(function() {
			$("div").toggle(); // version 3대에서는 숨기기/보이기 반복
		});
		
		$("div").hover(function() { // 마우스 포인터가 올라 왔을때 처리할 함수
			$(this).css('background','silver');
		}, function() { // 마우스 포인터가 빠져 나갔을때 처리할 함수 
			$(this).css('background','white');
		});
		
		// 테이블의 행에 마우스가 올라가면 배경이 하늘색으로 바뀌게 하고 싶다.
		$("tr")
		.not($("tr").first()) // 첫 줄만 제외시킨다.
		.css('cursor','pointer') // 포인터를 손가락으로
		.hover(function() { // 마우스 포인터가 올라 왔을때 처리할 함수
			$(this).css('background','skyblue');
		}, function() { // 마우스 포인터가 빠져 나갔을때 처리할 함수 
			$(this).css('background','white');
		})
		.click(function(){
			alert($(this).text().trim());
		});
	});
</script>
<style type="text/css">
	
</style>
</head>
<body>
	<button>눌러봐</button>
	<div>내가 아직도 보이니?</div>
	<hr />
	<table border="1">
		<tr bgcolor="silver">
			<td>No</td>
			<td>제목</td>
		</tr>
		<tr>
			<td>1</td>
			<td>이것은 어디에 쓰는 물건인고.......</td>
		</tr>
		<tr>
			<td>1</td>
			<td>이것은 어디에 쓰는 물건인고.......</td>
		</tr>
		<tr>
			<td>1</td>
			<td>이것은 어디에 쓰는 물건인고.......</td>
		</tr>
		<tr>
			<td>1</td>
			<td>이것은 어디에 쓰는 물건인고.......</td>
		</tr>
		<tr>
			<td>1</td>
			<td>이것은 어디에 쓰는 물건인고.......</td>
		</tr>
		<tr>
			<td>1</td>
			<td>이것은 어디에 쓰는 물건인고.......</td>
		</tr>
		<tr>
			<td>1</td>
			<td>이것은 어디에 쓰는 물건인고.......</td>
		</tr>
		<tr>
			<td>1</td>
			<td>이것은 어디에 쓰는 물건인고.......</td>
		</tr>
	</table>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>윈도우 객체</title>
<script type="text/javascript">
	window.onload = function(){
		
		document.getElementById("btn1").onclick = function(){
			window.open('');
		}
		
		document.getElementById("btn2").onclick = function(){
			window.open('https://www.naver.com');
		}
		
		document.getElementById("btn3").onclick = function(){
			var naver = window.open('https://www.naver.com','newWin');
		}
		
		document.getElementById("btn4").onclick = function(){
			var naver = window.open('https://www.naver.com','newWin','width=300, height=400, menubar=no, location=no');
		}

		document.getElementById("btn5").onclick = function(){
			window.open('JSWindowEx01.jsp'); // 만들어져 있는 문서로 새창 만들기
		}
		
		document.getElementById("btn6").onclick = function(){
			var win = window.open(''); // 빈문서 만들기
			win.document.writeln("<h1>꽝꽝꽝</h1>"); // 내용 추가하기
			win.document.writeln("<h1>꽝꽝꽝</h1>");
		}
		
		
		
	}
</script>
</head>
<body>
	<h1>새로운 창 열기</h1>
	<button id="btn1">새창열기 1</button>
	<button id="btn2">새창열기 2</button>
	<button id="btn3">새창열기 3</button>
	<button id="btn4">새창열기 4</button>
	<button id="btn5">새창열기 5</button>
	<button id="btn6">새창열기 6</button>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트전달 강제 취소</title>
<script type="text/javascript">
	window.onload = function(){
		document.getElementById("spanTag").onmouseover = function(){
			this.style.backgroundColor = 'pink';
		}
		document.getElementById("spanTag").onmouseout = function(){
			this.style.backgroundColor = 'white';
		}
		document.getElementById("spanTag").onclick = function(e){
			var event = e || Event;
			alert('SPAN태그 클릭');
			// 이벤트 전달 취소
			event.cancelBubble = true;
			if(event.stopPropagation){
				event.stopPropagation();
			}
		}
		document.getElementById("hTag").onmouseover = function(){
			this.style.backgroundColor = 'skyblue';
		}
		document.getElementById("hTag").onmouseout = function(){
			this.style.backgroundColor = 'white';
		}

		document.getElementById("hTag").onclick = function(e){
			var event = e || Event;
			alert('H1태그 클릭');
			// 이벤트 전달 취소
			event.cancelBubble = true;
			if(event.stopPropagation){
				event.stopPropagation();
			}
		}
		document.getElementById("inner").onclick = function(e){
			var event = e || Event;
			alert('안의 DIV 클릭');
			// 이벤트 전달 취소
			event.cancelBubble = true;
			if(event.stopPropagation){
				event.stopPropagation();
			}
		}
		document.getElementById("outer").onclick = function(e){
			var event = e || Event;
			alert('밖의 DIV 클릭');
			// 이벤트 전달 취소
			event.cancelBubble = true;
			if(event.stopPropagation){
				event.stopPropagation();
			}
		}
	}
</script>
<style type="text/css">
	div, h1, span { padding :10px; border : 1px solid gray; cursor: pointer;}
	/*
	h1:hover {background-color: pink;}
	span:hover {background-color: skyblue;}
	div#outer:hover {background-color: yellow;}
	div#inner:hover {background-color: orange;}
	*/
</style>
</head>
<body>
	<div id="outer" >
		<div id="inner" >
			<h1 id="hTag">
				<span id="spanTag">나는 문단</span>
			</h1>
		</div>
	</div>
</body>
</html>
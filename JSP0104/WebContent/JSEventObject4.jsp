<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 강제 발생</title>
<script type="text/javascript">
	window.onload = function(){
		document.getElementById("box1").onclick = function(){
			this.innerText = appendStar(this.innerText);
		}
		document.getElementById("box2").onclick = function(){
			this.innerText = prependStar(this.innerText);
		}
		document.getElementById("box3").onclick = function(){
			this.innerText = prependStar(appendStar(this.innerText));
		}
	};
	// 앞에 별
	function appendStar(content){
		return content + "★";
	}
	// 뒤에 별
	function prependStar(content){
		return "★" + content;
	}
</script>
<style type="text/css">
	div {
		border:1px solid gray; padding:10px; font-size: 20pt; margin: 10px;
		text-align: left; cursor: pointer;
	}
</style>	
</head>
<body>
	<div id="box1">나를 눌러줘 - 뒤에 별이 생긴다.</div>
	<div id="box2">나를 눌러줘 - 앞에 별이 생긴다.</div>
	<div id="box3">나를 눌러줘 - 앞뒤에 별이 생긴다.</div>
</body>
</html>
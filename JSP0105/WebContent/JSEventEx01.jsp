<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 이벤트 제거</title>
<script type="text/javascript">
	// btn1과 btn2에 전송기능 기능을 취소해보자
	window.onload = function(){
		/*
		document.getElementById("btn1").onclick(){
			alert('버튼을 눌렀냐!!!\n전송을 취소하마');
			return false;
		}
		document.getElementById("btn2").onclick(){
			alert('그림을 눌렀냐!!!\n전송을 취소하마');
			return false; // 기본 이벤트 취소
		}
		*/
	}
	function formCheck(){
		var value= document.getElementById("name").value;
		if(value==null || value.trim()==""){
			alert("이름은 반드시 입력해야 합니다.");
			return false; // 기본 이벤트 취소
		}
	}
	function chk(){
		if(!confirm('네이버로 갈까? 말까?')){
			return false; // 기본 이벤트 취소
		}
	}
</script>
</head>
<body>
	<a href="http://www.naver.com" onclick="return chk();">네이버로 가기</a>
	<br /><hr />

	<form action="result.jsp" method="post" onsubmit="return formCheck();">
		이름 : <input type="text" name="name" id="name" />
		<br />
		<!-- 아래 3가지는 모두 서브밑이 이루어 진다. -->
		<input type="submit" value="전송" />
		<button id="btn1">나는 버튼인데 전송이될까?</button>
		<input id="btn2" type="image" src = "images/button.jpg" />
		<!-- 이것은 전송이 이루어지지 않는다. -->
		<input type="button" value="눌러봐" />
	</form>
</body>
</html>
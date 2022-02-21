<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function(){
		var tagNode = document.createElement("h1"); // 태그 생성
		var textNode = document.createTextNode("Hello JavaScript"); // 글자 노드 생성
		tagNode.appendChild(textNode); // 태그안에 자식으로 글자노트 추가
		document.body.appendChild(tagNode); // body태그의 자식으로 태그노드를 추가
		
		document.body.appendChild(document.createElement("hr")); 
		
		var imgTag = document.createElement("img");
		imgTag.src = "images/a.jpeg";
		imgTag.width = 300;
		imgTag.height = 300;
		document.body.appendChild(imgTag); 

		document.body.appendChild(document.createElement("hr")); 
	}
</script>
</head>
<body>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트전달이 되는 경우</title>
<script type="text/javascript">

</script>
<style type="text/css">
	div, h1, span { padding :10px; border : 1px solid gray; cursor: pointer;}
	h1:hover {background-color: pink;}
	span:hover {background-color: skyblue;}
	div#outer:hover {background-color: yellow;}
	div#inner:hover {background-color: orange;}
</style>
</head>
<body>
	<div id="outer" onclick="alert('밖의 DIV')">
		<div id="inner" onclick="alert('안의 DIV')">
			<h1 onclick="alert('H1태그 클릭')">
				<span onclick="alert('SPAN태그 클릭')">나는 문단</span>
			</h1>
		</div>
	</div>
</body>
</html>
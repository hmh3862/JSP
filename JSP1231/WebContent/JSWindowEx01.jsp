<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>윈도우 객체</title>
<script type="text/javascript">
	var result = "<ul>";
	for(key in window){
		result += "<li>";
		result += key + " : " + window[key]		
		result += "</li>";
	}
	result += "</ul>";
	document.writeln(result);
</script>
</head>
<body>

</body>
</html>
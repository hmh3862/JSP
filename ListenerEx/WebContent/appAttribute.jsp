<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
<%
	application.setAttribute("name", "한사람"); // 애플리케이션 영역에 속성이 추가됨
	
	application.setAttribute("name", "두사람"); // 애플리케이션 영역에 속성이 변경됨
	
	application. removeAttribute("name"); // 애플리케이션 영역에 속성이 제거됨

%>
</body>
</html>
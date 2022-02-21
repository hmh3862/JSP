<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDateTime"%>
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
	<h1>Hello 0105!!!</h1>
	현재 시간 : <%=new Date().toLocaleString() %> <br />
	현재 시간 : <%=LocalDateTime.now() %> <br />
</body>
</html>
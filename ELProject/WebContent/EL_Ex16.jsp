<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 사용자가 만든 tld파일을 지정해주면 사용자가 만든 정적 메서드들을 사용 가능해진다. --%>
<%@ taglib prefix="my" uri="/my-function.tld" %>
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
	root 4의 값은 : ${my:sqrt(4) } <br />
	난수 : ${my:random() } <br />
	난수 : ${my:random() } <br />
	난수 : ${my:random() } <br />
	난수 : ${my:random() } <br />
	
	<jsp:useBean id="today" class="java.util.Date"/>
	
	오늘 : ${today } <br />
	오늘 : ${my:now(today) } <br />
	오늘 : ${my:yymmdd(today) } <br />
	오늘 : ${my:mmdd(today) } <br />
	오늘 : ${my:hhmm(today) } <br />
	오늘 : ${my:hhmmss(today) } <br />
</body>
</html>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL에서 자바 객체의 사용</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<jsp:useBean id="date" class="java.util.Date" scope="page"/> <%-- new date = new Date(); --%>
	현재 : <%=date %> <br />
	현재 : ${date } <br />
	년도 : <%=date.getYear()+1900 %> 년 <br />
	년도 : ${date.year+1900 } 년 <br />
	월 : <%=date.getMonth()+1 %> 월 <br />
	월 : ${date.month+1 } 월 <br />
	일 : <%=date.getDate() %> 일 <br />
	일 : ${date.date } 일 <br />
</body>
</html>
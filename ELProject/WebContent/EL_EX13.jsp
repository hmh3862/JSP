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
<title>EL에서 Map의 사용</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<%
		Map<String,String> map = new HashMap<>();
		map.put("A", "하하하");
		map.put("B", "호호호");
		map.put("C", "아아아");
		map.put("D", "어어어");
		map.put("E", "크크크");
		request.setAttribute("map", map);
	%>
	<h1>EL로 Map 출력</h1>
	${map } <br />
	크기 : ${fn:length(map) }개 <br />
	<hr />
	<c:forEach var="name" items="${map }">
		${name } <br />
	</c:forEach>
	<hr />
	${map['A'] }, ${map['C'] } <br /> 
	${map.A }, ${map.C } <br /> 
	
</body>
</html>
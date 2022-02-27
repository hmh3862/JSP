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
<title>EL에서 사용자 자바 객체의 사용</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>
	<jsp:useBean id="vo" class="kr.green.el.vo.PersonVO"/>
	<jsp:setProperty property="name" name="vo" value="한사람"/>
	<jsp:setProperty property="age" name="vo" value="18"/>
	<jsp:setProperty property="gender" name="vo" value="true"/>
	
	${vo } <br />
	이름 : ${vo.name } <br />
	나이 : ${vo.age } <br />
	성별 : ${vo.gender ? "남":"여" } <br />
</body>
</html>
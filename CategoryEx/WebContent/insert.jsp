<%@page import="java.util.List"%>
<%@page import="kr.green.category.mybatis.MybatisApp"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:requestEncoding value="UTF-8"/> <%-- 한글 깨짐 방지 --%>
<c:if test="${pageContext.request.method != 'POST' }"> <%-- POST전송만 처리 --%>
	<c:redirect url="listTest.jsp"/>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 데이터 받기 --%>
	<jsp:useBean id="vo" class="kr.green.category.vo.CategoryVO"/>
	<jsp:setProperty property="*" name="vo"/>
	
	<%
		// 나중에 이 부분은 서비스클래스와 DAO클래스로 뺼것이다.
	SqlSession sqlSession = MybatisApp.getSqlSessionFactory().openSession(false); // 자동커밋 취소
	try{
		sqlSession.insert("category.insert", vo); // 일단 저장
		sqlSession.update("category.updateRef");  // ref 갱신
		
		sqlSession.commit();
	}catch(Exception e){
		sqlSession.rollback();
		e.printStackTrace();
	}finally{
		if(sqlSession!=null) sqlSession.close();
	}
	
	// 목록으로 다시가기
	response.sendRedirect("listTest.jsp");
	%>
</body>
</html>
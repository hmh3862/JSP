<%@page import="kr.green.board.service.BoardServiceImpl"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="UTF-8"/>

<c:if test='${pageContext.request.method != "POST" }'>
	<c:redirect url="index.jsp"/>
</c:if>

<%-- 공통코드 삽입 --%>
<%@ include file="include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/commons.js"></script>
</head>
<body>
	<%-- 넘어온 데이터 받기 --%>
	<jsp:useBean id="vo" class="kr.green.board.vo.BoardVO"></jsp:useBean>
	<jsp:setProperty property="*" name="vo"/>
	<jsp:setProperty property="ip" name="vo" value="${pageContext.request.remoteAddr }"/>
	
	<%-- 모드 값에따라 저장/수정/삭제를 서비스 클래스를 불러서 처리하면 된다.  --%>
	<%
		String query = "";
		int count = 0;
		switch(mode){
		case 1: // 저장
			try{
				BoardServiceImpl.getInstance().insert(vo);
				// 성공하면 목록으로
				out.println("<script>sendPost(\"index.jsp\",{\"p\":1,\"s\":"+pageSize+",\"b\":"+blockSize+" })</script>");
			}catch(Exception e){
				// 실패해도 목록으로
				out.println("<script>sendPost(\"index.jsp\",{\"p\":"+currentPage+",\"s\":"+pageSize+",\"b\":"+blockSize+" })</script>");
			}
			break;
		case 2: // 수정
			try{
				BoardServiceImpl.getInstance().update(vo);
				// 성공하면 내용보기로
				out.println("<script>sendPost(\"view.jsp\",{\"p\":"+currentPage+",\"s\":"+pageSize+",\"b\":"+blockSize+",\"idx\":"+idx+",\"h\":0})</script>");
			}catch(Exception e){
				// 실패하면 수정 폼으로
				out.println("<script>sendPost(\"update.jsp\",{\"p\":"+currentPage+",\"s\":"+pageSize+",\"b\":"+blockSize+",\"idx\":"+idx+",\"h\":0})</script>");
			}
		
			break;
		case 3: // 삭제
			try{
				BoardServiceImpl.getInstance().delete(vo);
				// 성공하면 목록보기로
				out.println("<script>sendPost(\"index.jsp\",{\"p\":"+currentPage+",\"s\":"+pageSize+",\"b\":"+blockSize+"})</script>");
			}catch(Exception e){
				// 실패하면 삭제 폼으로
				out.println("<script>sendPost(\"delete.jsp\",{\"p\":"+currentPage+",\"s\":"+pageSize+",\"b\":"+blockSize+",\"idx\":"+idx+",\"h\":0})</script>");
			}
			break;
		}
	%>
</body>
</html>
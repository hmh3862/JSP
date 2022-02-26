<%@page import="kr.green.freeboard.service.FreeBoardServiceImpl"%>
<%@page import="kr.green.freeboard.vo.FreeBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include.jsp" %>
<%
	if(!request.getMethod().equals("POST")){
		response.sendRedirect("index.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="vo" class="kr.green.freeboard.vo.FreeBoardVO"></jsp:useBean>
	<jsp:setProperty property="*" name="vo"/>
	<jsp:setProperty property="ip" name="vo" value="${pageContext.request.remoteAddr }"/>
	
	<%
		String query = "";
		int count = 0;
		switch(mode){
		case 1:
			count = FreeBoardServiceImpl.getInstance().insert(vo);
			if(count==0){
				out.println("<script>alert('저장 실패!')</script>");
				query = "index.jsp?p="+currentPage+"&s="+pageSize+"&b="+blockSize;
			}else{
				out.println("<script>alert('저장 성공!')</script>");
				query = "index.jsp?1&s="+pageSize+"&b="+blockSize;
			}
			break;
		case 2:
			count = FreeBoardServiceImpl.getInstance().insert(vo);
			if(count==0){
				out.println("<script>alert('수정 실패!')</script>");
				query = "update.jsp?p="+currentPage+"&s="+pageSize+"&b="+blockSize+"&idx="+idx+"&h=0";
			}else{
				out.println("<script>alert('수정 성공!')</script>");
				query = "view.jsp?p="+currentPage+"&s="+pageSize+"&b="+blockSize+"&idx="+idx+"&h=0";
			}
			break;
		case 3:
			count = FreeBoardServiceImpl.getInstance().insert(vo);
			if(count==0){
				out.println("<script>alert('삭제 실패!')</script>");
				query = "delete.jsp?p="+currentPage+"&s="+pageSize+"&b="+blockSize+"&idx="+idx+"&h=0";
			}else{
				out.println("<script>alert('삭제 성공!')</script>");
				query = "index.jsp?p="+currentPage+"&s="+pageSize+"&b="+blockSize;
			}
			break;
		}
		out.println("<script>location.href='"+query+"'</script>");
	%>
</body>
</html>
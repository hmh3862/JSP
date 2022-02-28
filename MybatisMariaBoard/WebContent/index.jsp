<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.green.board.service.BoardServiceImpl"%>
<%@page import="kr.green.board.service.BoardService"%>
<%@page import="kr.green.board.dao.BoardDAOImpl"%>
<%@page import="kr.green.board.vo.BoardVO"%>
<%@page import="kr.green.board.vo.PagingVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 공통코드 삽입 --%>
<%@ include file="include.jsp" %>
<%
	// 1페이지 분량의 글을 얻어온다.
	PagingVO<BoardVO> pagingVO = BoardServiceImpl.getInstance().selectList(currentPage, pageSize, blockSize);
	request.setAttribute("pv", pagingVO);
	pageContext.forward("indexView.jsp");
%>

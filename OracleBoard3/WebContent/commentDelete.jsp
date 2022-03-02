<%@page import="kr.green.board.service.CommentServiceImpl"%>
<%@page import="kr.green.board.service.CommentService"%>
<%@page import="kr.green.board.vo.CommentVO"%>
<%@ page contentType="text/palin; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
String idx = request.getParameter("idx");
String password = request.getParameter("password");

CommentVO commentVO = new CommentVO();

commentVO.setIdx(Integer.parseInt(idx));
commentVO.setPassword(password);

System.out.println(commentVO);

CommentServiceImpl.getInstance().deleteByIdx(commentVO);
out.println(1);
%>
<%@page import="kr.green.jdbc.JDBCUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// Connection Pool에서 연결 자원(Connection)을 얻어온다,
Context initContext = new InitialContext();
Context envContext  = (Context)initContext.lookup("java:/comp/env");
DataSource ds = (DataSource)envContext.lookup("jdbc/MariaDB");
Connection conn = ds.getConnection();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>연결성공 : <%=conn%></h1>
	
	<% JDBCUtil.close(conn); // 자원을 Connection Pool로 반환한다. %>
</body>
</html>


<%@page import="kr.green.jdbc.JDBCUtil"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 1. 준비
	Connection conn =  null; // 연결 객체
	Statement  stmt = null;  // 명령 객체
	ResultSet  rs = null;    // 결과 객체
	String className = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/javadb";
	String user = "javauser";
	String password = "123456";
	try{
		// 3. 연결한다.
		conn = JDBCUtil.getConnection(className, url, user, password);
		out.println("연결 성공 : " + conn + "<br>");
		// 4. 사용한다.
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select * from hr_employees");
		if(rs.next()){
			do{
				out.println(rs.getString(1) + ". " + rs.getString("first_name") 
				            + " " + rs.getString("last_name") + " : " + rs.getInt("SALARY") + "<br>" );
			}while(rs.next());
		}else{
			out.println("데이터 없다!!!<br>");
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%
	}catch(SQLException e){
		;
	}finally{
		// 5. 닫는다.
		JDBCUtil.close(rs);
		JDBCUtil.close(stmt);
		JDBCUtil.close(conn);
	}
%>
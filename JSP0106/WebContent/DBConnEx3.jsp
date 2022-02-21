<%@page import="kr.green.jdbc.JDBCUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	Statement  stmt = null;
	PreparedStatement pstmt = null;
	ResultSet  rs = null;
	
	try{
		conn = JDBCUtil.getConnection();
		System.out.println("연결 성공 : " + conn);
		//--------------------------------------------------------------------------------------------------
		// 이 부분만 변경하여 코딩을 하면된다. 나중에는 이부분을 짜증나니까 클래스로 뺀다!!!!
		// 트랜젝션 처리가 되지 않아 두사람은 저장이 되었고 세사람은 저장되지 않았다.
		// 저장
		String sql = "insert into test (idx, name) values (0, '두사람')";
		stmt = conn.createStatement();
		int result = stmt.executeUpdate(sql);
		System.out.println("저장 성공 : " + result);
		// =======================================
		// 일부러 에러를 발생시켜보자!!! 
		// 이미 존재하는 key값으로 저장을 하면 키필드는 중복을 허용하지 않기 때문에 에러가 발생할 거다!!!!
		sql = "insert into test (idx, name) values (1, '세사람')";
		result = stmt.executeUpdate(sql);
		System.out.println("저장 성공 : " + result);
		// =======================================
		
		// 저장 확인
		sql = "select * from test order by idx desc";
		rs = stmt.executeQuery(sql);
		if(rs.next()){
			System.out.println("데이터 목록");
			do{
				System.out.println(rs.getInt("idx") + ". " + rs.getString("name"));
			}while(rs.next());
		}else{
			System.out.println("데이터가 없습니다.");
		}
		//--------------------------------------------------------------------------------------------------
	}catch(Exception e){
		System.out.println("연결 실패 : " + e.getMessage());
		e.printStackTrace();
	}finally{
		JDBCUtil.close(rs);
		JDBCUtil.close(stmt);
		JDBCUtil.close(pstmt);
		JDBCUtil.close(conn);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
<style type="text/css">

</style>
</head>
<body>

</body>
</html>
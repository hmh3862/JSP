<%@page import="java.util.List"%>
<%@page import="kr.green.memo.vo.MemoVO"%>
<%@page import="kr.green.memo.dao.MemoDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.green.jdbc.JDBCUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Connection conn = null;
try{
	conn = JDBCUtil.getDBCP();
	// System.out.println("연결 성공 : " + conn);
	// 1. 트랜젝션을 처리하기 위해 자동커밋을 취소한다.
	conn.setAutoCommit(false);
	//--------------------------------------------------------------------------------------------------
	// 이부분만 바뀐다.
	
	// 데이터를 받았더고 가정하고
	MemoVO memoVO = new MemoVO();
	memoVO.setName("한사람");
	memoVO.setPassword("1234");
	memoVO.setContent("와 1등이다~~~~");
	memoVO.setIp("192.168.0.69");
	
	// DB에 저장해보자!!
	int count = MemoDAO.getInstance().insert(conn, memoVO);
	int  totalCount =  MemoDAO.getInstance().getTotalCount(conn);
	List<MemoVO> list = MemoDAO.getInstance().selectList(conn);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	저장 : <%=count %>개 저장 완료!!! <br />
	전체 개수 :  <%=totalCount %>개!!! <br />
	<hr />
	<%
		for(MemoVO vo : list)
			out.println(vo + "<br>");
	
	%>
</body>
</html>
<%
	//--------------------------------------------------------------------------------------------------
	// 2. 모든 명령이 에러가 없이 실행 되었다면 DB에 적용시키자.
	conn.commit();
}catch(Exception e){
	// 3. 여러개 명령어 중에서 1개라도 에러가 발생하면 실행한 명령 모두를 취소하자!!!
	JDBCUtil.rollback(conn);
	System.out.println("연결 실패 : " + e.getMessage());
	e.printStackTrace();
}finally{
	JDBCUtil.close(conn);
}
%>



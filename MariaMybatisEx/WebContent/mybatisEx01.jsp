<%@page import="kr.green.mybatis.jdbc.MybatisApp"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<%
		SqlSession sqlSession = null; 
		try{
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			out.println("연결 성공 : " + sqlSession + "<br>");
			//-----------------------------------------------------------------
			// 서비스 클래스의 기본 모양으로 중간 부분이 바뀐다.
			
			
			//-----------------------------------------------------------------
			sqlSession.commit();
		}catch(Exception e){
			sqlSession.rollback();
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
	%>
</body>
</html>
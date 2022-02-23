<%@page import="kr.green.poll.vo.PollVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
<style type="text/css">
	table {
		width: 450px; border: 1px solid gray; margin: auto;	padding: 5px;
	}
	.title {
		background-color: black; color: white; text-align: center;
		font-size: 15pt; font-weight: bold; padding: 5px;
	}
	.subject {
		font-size: 12pt; font-weight: bold; padding: 5px;
	}
</style>
</head>
<body>
	<%
		// 데이터 파일을 읽어서 출력해보자
		String path = application.getRealPath("poll");  // -해석 : path에  웹 어플리케이션의 경로를 추가  = path에 poll이라는 경로단어를 추가
		String fileName = "poll.json";                //-해석 : filName에 Poll.jsp라는 단어를 추가
		
		
		FileReader fr = new FileReader(path + File.separator + fileName);  // -해석 :  fr에 파일경로를 추가한다. path + File.separator + fileName 이게 사실상   FileReader fr = new FileReader(poll\poll.json)이렇게 생각하면된다.
		Gson gson = new Gson();  // Gson을 생성
		PollVO pollVO = gson.fromJson(fr, PollVO.class);  
		// -해석 :  PollVO를 pollvo로 이름을 바꿔주고 그 안에 gson.fromJson(fr, PollVO.class)를 넣어준다. 
		//-해석 : gson.fromJson(fr, PollVO.class)는  fr문자열을  pollVO 클래스로 변환시킨다. 즉, poll\poll.json을 읽어서 pollvo클래스에 객체로 집어넣는다. (가상의메모리를 사용한다고 보시면됩니다.)											
		
		fr.close(); // 썼으니까 닫아야죠?
		
		// out.println(pollVO);
	%>
	<form action="pollOk.jsp" method="post">
	<table>
		<tr>
			<td class="title">설문조사 프로그램 Ver 1.0</td>
		</tr>
		<tr>
			<td class="subject">설문 : <%=pollVO.getTitle() %></td>
		</tr>
		<tr>
			<td>
				<%
					int i=0;
					for(String item : pollVO.getItems()){
				%>
					<label> 
						<input type="radio" value="<%=i++%>" name="poll" 
						       <%=(i==1) ? " checked='checked' " : "" %> >
						<%=item %> 
					</label>
					<br />
				<%						
					}
				%>
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type="submit" value="투표하기" />
				<input type="button" value="결과보기" onclick="location.href='pollResult.jsp'"/>  <!-- 결과보기를 누르면 pollResult로 이동~  -->
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
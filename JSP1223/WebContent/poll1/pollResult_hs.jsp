<%@page import="java.util.List"%>
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
		
		// - 해석 : 이건 pollForm 확인 하시면됩니다.
		String path = application.getRealPath("poll");
		String fileName = "poll.json";
		
		FileReader fr = new FileReader(path + File.separator + fileName);
		Gson gson = new Gson();
		PollVO pollVO = gson.fromJson(fr, PollVO.class);
		fr.close();
		
		// out.println(pollVO);
	%>
	<table>
		<tr>
			<td class="title">설문조사 프로그램 Ver 1.0</td>
		</tr>
		<tr>
			<td align="right">총 투표수 : <%=pollVO.getTotalCount() %>표</td>
		</tr>
		<tr>
			<td class="subject">설문 : <%=pollVO.getTitle() %></td>
		</tr>
		<tr>
			<td>
				<%
					String[] colors = "red,green,blue,pink,brown,skyblue".split(",");//- 해석 : String color [red,green,blue,pink,brown,skyblue]중에 , 단위로 배열을 나눈다.
					List<String> items = pollVO.getItems(); // - 해석 : lombok을 이용한 pollvo 클래스라서 getitems를 불러올수 있으며 pollvo를 보면 배열로 잡았다. 또한 poll.json을 보면 items이 배열로 되어있다. 따라서 배열로 잡아준다.
					List<Integer> counts = pollVO.getCounts(); // - 해석 : 이 또한 lombok을 이용했기에 getcount로 불러올수 있으며 pollvo를 보면 배열로 잡았다. 또한 poll.json을 보면 Counts이 배열로 되어있다. 따라서 배열로 잡아준다.
					for(int i=0;i<items.size();i++){// - 해석 : i는 0인상태에서 items의 갯수보다 적으면 계속 상승. 즉 i가 items갯수보다 많으면 for문 탈출
						out.print((i+1) + ". " + items.get(i) + "(" + counts.get(i) + "표, " + pollVO.getPercent(i) +")<br>");// - 해석 :i가0인경우= 1(i+1) + . 좋은사람(items.get(0)(0(counts.get(0)표, 0.00%(pollVO클래스에 있는 getPercent를 가져온다.)) 
						out.print("<hr size='10' align='left' width='" + pollVO.getPercent(i)   // -해석 : 이부분은 그래프를 만들었다고 보시면됩니다.
						          + "' color='" + colors[i%colors.length] + "'/>");  // - 해석 : 그래프의 색상 추가
					}
				%>
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type="button" value="돌아가기" onclick="location.href='pollForm.jsp'"/> <!-- 돌아가기를 누르면 pollForm.jsp로 이동 -->
			</td>
		</tr>
	</table>
</body>
</html>
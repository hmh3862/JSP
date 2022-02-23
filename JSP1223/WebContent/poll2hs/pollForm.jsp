<%@page import="java.io.File"%>
<%@page import="kr.green.poll.vo.PollUtil"%>
<%@page import="kr.green.poll.vo.PollVO"%>
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
		// 파일 번호를 받아서 해당 파일을 읽어보자!!!
		request.setCharacterEncoding("UTF-8");                  //- 해석 : UTF-8로 인코딩해라
		String fileNo = request.getParameter("no");   //- 해석 : http요청의 값을 no로 받아오겠다는말, 즉 여기서는 파일번호로 받겠다고 생각하심됩니다. 
		
		if(fileNo==null || fileNo.trim().equals("")){ // 파일 번호가 넘어오지 않았다면
			fileNo="1"; // 기본값으로 1을 가지자!!!
		}
		
		// 데이터 파일을 읽어서 출력해보자
		String path = application.getRealPath("poll");    // - 해석 : path라는 단어에 poll이라는 웹 어플리케이션 경로를 설정
		String fileName = "poll0" + fileNo + ".json";    // - 해석 : fileName에 poll0[no].json이라는 단어를 추가
		
		// 해당 파일이 존재하지 않으면 무조건 1번을 열도록 하자!!!
		File file = new File(path + File.separator + fileName);   //- 해석 : File이라는 단어에 poll\poll0[no].json를 추가한다.
		if(!file.exists()){                              // - 해석 : 파일이 존재하지 않는다면
			fileNo = "1";                                  // - 해석 : fileNo는 1로 설정
			fileName = "poll0" + fileNo + ".json";       // - 해석 :  fileName은 따라서 poll01.json으로 설정하겠다.
		}
		
		PollVO pollVO = PollUtil.readPollVO(path, fileName); 
		
		/*정리  : 
			1. 'no'라는 단어에 요청값을 설정하여 fileNo에 추가한다. (당장에 윗줄에서부터 해석하면 아무것도 설정되어있지 않아 no값은 없다고 보면된다.)
			2. 현재 fileNo 즉 no의 값이 없는 상태인 상황에서 if(fileNo==null || fileNo.trim().equals("")) 즉 아무것도 없으면 fileNo="1"; 
				fileNo = request.getParameter("1");이 된다. 
			3. path에는 poll이라는 경로가 설정되어있고 fileName에는 2번이 설정되어 있으니 poll01.jsp가 된다.
			4. file이라는 단어 안에 poll\poll01.jsp 경로를 넣는다.
			5. file안에 내용이 존재하지 않는다면 fileNo를 1로 넣겠다. 그리고 fileName을 poll01.json으로 만들겠다. (혹시모를 상황에 대비해 확실하게 만들었다 생각하시면 좋을거같습니다. 재차확인 하는거라 생각하시는게 ㅋㅋ)
			6. pollVO에 pollutil.readPollvo(path, fileName)를 대입 이말은 즉슨 pollUtil클래스를 봐야겠죠?
				- 만약 실제로 업무에 이 프로젝트가 들어간다고 하면 Pollutil.java먼저 만들고 pollForm.jsp를 만드는게 맞습니다.
		 
			※ poll01.json을 확인하면 item은 5개 counts도 5개입니다. 이걸 확인하고 아래 내용을 보세요.
		*/
		
		
	%>
	<form action="pollOk.jsp" method="post">  <!--  pollOK.jsp로 넘기겠다. 즉 투표하기를 누르면 pollOK.jsp로 넘어간다. -->
	<%-- 넘길때 파일번호도 넘겨줘야 한다. --%>
	<input type="hidden" value="<%=fileNo%>" name="no">
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
					for(String item : pollVO.getItems()){ //해석 : item이라는 단어에 PollVO 클래스 안에 있는 getItem을 대입
				%>
					<label> 
						<input type="radio" value="<%=i++%>" name="poll" <%=(i==1) ? " checked='checked' " : "" %> >
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
				<input type="button" value="결과보기" onclick="location.href='pollResult.jsp?no=<%=fileNo%>'"/> <!-- pollResult.jsp?no=fileNo(1~5) -->
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
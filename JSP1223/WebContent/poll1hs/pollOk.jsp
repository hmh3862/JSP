<%@page import="java.io.PrintWriter"%>
<%@page import="kr.green.poll.vo.PollVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 한글을 받으려면 인코딩 타입 지정해 주어야 한다.
	request.setCharacterEncoding("UTF-8");													// - 해석 : UTF-8버전으로 인코딩!

	// POST전송이 아니면 폼으로 다시 보내버린다. 
	// 이코드가 없으면 이파일을 직접 실행했을때 넘어오지 않은 데이터를 
	// 처리하기때문에 에러가 발생할 소지가 다분하다. 
	if(!request.getMethod().equals("POST")){   // - 해석 : HTTP 요청을 하면서 전송한 값, 쿠키, 헤더 및 클라이언트 정보를 가져올수 있는데 POST(값을 노출안함), GET(값이 노출됨) 방식이있으며 노출방지를 위해 POST를 사용 
		response.sendRedirect("pollForm.jsp"); // 지정 페이지로 무조건 이동하라. //- 해석 : pollForm.jsp로 무조건 이동시킨다.
		return; // 여기서 종료!!
	}

	// 넘어온 값을 받아보자!!!
	int poll = Integer.parseInt(request.getParameter("poll"));  
	
	// 원본파일을 수정해서 다시 저장해야 한다.......
	// 1) 데이터 파일을 읽어서  (- 해석 : 더 이상 설명 안해도 되죠? FileReader 읽어오는거 pollForm.jsp 참고하세요)
	String path = application.getRealPath("poll");
	String fileName = "poll.json";
	FileReader fr = new FileReader(path + File.separator + fileName);
	Gson gson = new Gson();
	PollVO pollVO = gson.fromJson(fr, PollVO.class);
	fr.close();
	
	
	// 2) 투표한 항목의 투표수를 1 증가 시키고 
	pollVO.getCounts().set(poll, pollVO.getCounts().get(poll)+1);
	
	// 3) 다시 저장한다.
	PrintWriter pw = new PrintWriter(path + File.separator + fileName);  // - 해석 : FileReader은 읽어오는거면 반대로 이건 저장한다고 생각하심됩니다.
 	gson.toJson(pollVO, pw);          // - 해석 : PollVO 클래스를 poll/poll.jsp 형식으로 변환. 즉, from으로 가져왔을때는 pollVO클래스 형식에 맞춰서 변환해줬지만 이건 역으로 poll.jsp 형식에 맞춰 가상으로 json파일을 가상 메모리로 만든다고 생각하면됩니다.			
	pw.flush();							// - 해석 : bufer에쌓인 값을 다 보내준다. 쉽게 얘기하면 buffer에 값을 다 보내주어 안을 비운다고 생각하심됩니다. 이걸 안해주면 값이 엉망진창입니다.
	pw.close();						// - 해석 : 썼으니까 닫는다.
	// 4) 결과보기 화면으로 이동한다.
	response.sendRedirect("pollResult.jsp"); //- 해석 : 결과보기 창으로 이동
%>

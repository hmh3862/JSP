<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

int currentPage = 1;
try{
	currentPage = Integer.parseInt(request.getParameter("p"));
}catch(Exception e){
	;
}

int pageSize = 10;
try{
	pageSize = Integer.parseInt(request.getParameter("s"));
}catch(Exception e){
	;
}

int blockSize = 10;
try{
	blockSize = Integer.parseInt(request.getParameter("b"));
}catch(Exception e){
	;
}

int idx = 0;
try{
	idx = Integer.parseInt(request.getParameter("idx"));
}catch(Exception e){
	;
}

// 저장(1)/수정(2)/삭제(3) 구분
int mode = 0;
try{
	mode = Integer.parseInt(request.getParameter("m"));
}catch(Exception e){
	;
}

// 조회수 증가여부를 판단(0 : 증가안함, 1 : 증가)
int incHit = 0;
try{
	incHit = Integer.parseInt(request.getParameter("h"));
}catch(Exception e){
	;
}

request.setAttribute("p", currentPage);
request.setAttribute("s", pageSize);
request.setAttribute("b", blockSize);
request.setAttribute("idx", idx);
request.setAttribute("m", mode);
request.setAttribute("h", incHit);
%>
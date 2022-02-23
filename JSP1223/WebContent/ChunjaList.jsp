<%@page import="kr.green.chunja.co.Chunja2VO"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.io.FileReader"%>
<%@page import="kr.green.chunja.co.ChunjaVO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>천자문</title>
<%
	List<ChunjaVO> list = null;
	Gson gson = new Gson();
	try(FileReader fr = new FileReader(application.getRealPath("hanja/chunja.json"));){
		list = gson.fromJson(fr, new TypeToken<List<ChunjaVO>>(){}.getType());
		if(list==null) return;
	}catch(Exception e){
		;
	}
	List<Chunja2VO> list2 = null;
	try(FileReader fr = new FileReader(application.getRealPath("hanja/chunja2.json"));){
		list2 = gson.fromJson(fr, new TypeToken<List<Chunja2VO>>(){}.getType());
		if(list2==null) return;
	}catch(Exception e){
		;
	}
%>	
<style type="text/css">
	.box{ width: 100px; height:100px;border: 1px solid gray;padding:1px; margin: 3px; float: left;}
	.main{ font-size: 47pt; font-weight: bold; text-align: center;}
	.sub { background-color: black;color: white; font-weight:bold; padding: 5px; text-align: center;}
	.box2{ width: 440px; height:150px;border: 1px solid gray;padding:1px; margin: 3px; float: left;}
	.main2{ font-size: 47pt; font-weight: bold; text-align: center;}
	.sub2{ background-color: black;color: white; font-weight:bold; padding: 5px; text-align: center;}
	.desc{ padding: 5px; border: 0px solid gray;}
</style>
</head>
<body>
	<% for(ChunjaVO vo : list){ %>
		<div class="box">
			<div class="main"><%=vo.getH() %></div>
			<div class="sub"><%=vo.getK() %></div>
		</div>
	<% } %>
	<br style="clear: both;" /><br /><hr /><br />
	<% for(Chunja2VO vo : list2){ %>
		<div class="box2">
			<div class="main2"><%=vo.getH() %></div>
			<div class="sub2"><%=vo.getK() %></div>
			<div class="desc"><%=vo.getT() %></div>
		</div>
	<% } %>
	
</body>
</html>
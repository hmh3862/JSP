<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>윤년/평년 판단하기</title>
<script type="text/javascript">
	var today = new Date();
	var year = today.getFullYear();
	var result = "";
	for(i=year-50;i<=year+50;i++){
		result += "<option value='" + i +"'>" + i + "</option>\n";
	}
	
	function checkLeapYear(obj){
		/*
		// 윤년/평년 판단하여 출력하기
		var isLeapYear = false;
		// 년도가 400의 배수면 또는 년도가 4의 배수이면서 100의 배수가 아니면 윤년
		var yy = obj.value;
		if(yy%400==0 || yy%4==0 && yy%100!=0){
			isLeapYear = true;
		}
		alert(obj.value + "는 " + (isLeapYear ? "윤":"평") + "년입니다.");
		*/
		/*
		var yy = obj.value;
		var isLeapYear = yy%400==0 || yy%4==0 && yy%100!=0;
		alert(obj.value + "는 " + (isLeapYear ? "윤":"평") + "년입니다.");
		*/
		alert(obj.value + "는 "
				+ (obj.value%400==0 || obj.value%4==0 && obj.value%100!=0 ? "윤":"평") 
				+ "년입니다.");
	}
</script>
</head>
<body>
	년도 : 
	<select name="year" id="year" onchange="checkLeapYear(this);">
		<script> document.writeln(result); </script>
	</select>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모두선택/모두해제/선택반전</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("button").first().click(function() {
			$("input:checkbox").prop('checked', true); // 모든 체크박스를 체크로 만든다. 
		});
		$("button").eq(1).click(function() {
			$("input:checkbox").prop('checked', false);// 모든 체크박스를 체크를 해제한다.
		});
		$("button").last().click(function() {
			$("input:checkbox").each(function() {
				if($(this).is(':checked')){ // 체크가 되어있다면
					$(this).prop('checked', false); // 해제
				}else{
					$(this).prop('checked', true);  // 설정
				}
			});
		});
	});
</script>
<style type="text/css">
	
</style>
</head>
<body>
	<button>모두선택</button>
	<button>모두해제</button>
	<button>선택반전</button>
	<br /><hr />
	<label> <input type="checkbox" /> 선택 1</label> <br />
	<label> <input type="checkbox" /> 선택 2</label> <br />
	<label> <input type="checkbox" /> 선택 3</label> <br />
	<label> <input type="checkbox" /> 선택 4</label> <br />
	<label> <input type="checkbox" /> 선택 5</label> <br />
	<label> <input type="checkbox" /> 선택 6</label> <br />
</body>
</html>
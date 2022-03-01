<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>섬머노트 사용법</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- 언어 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/lang/summernote-ko-KR.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#summernote").summernote({
			lang: 'ko-KR',
	        placeholder: '내용을 입력하세요',
	        tabsize: 2,
	        height: 320,
	        toolbar: [
	          ['style', ['style']],
	          ['font', ['bold', 'underline', 'clear']],
	          ['color', ['color']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['table', ['table']],
	          ['insert', ['link', 'picture']],
	          ['view', ['fullscreen', 'codeview', 'help']]
	        ]
	      });
	});
</script>
<style type="text/css">

</style>
</head>
<body>
	<h1>섬머노트 사용법</h1>
	<form method="post" action="result.jsp">
  		<textarea id="summernote" name="content"></textarea>
  		<br />
  		<input type="submit" value="전송"/>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
$(function(){
	var arr = ${list}
	console.log(arr);
	$.each(arr,function(idx,data){
		var img = $("<img/>").attr("src","/img/"+data.photo_file_name);
		$("#sns").append(img);
		});
})
</script>
</head>
<body>
<a href="/MainPage">메인화면</a>
<h2>sns리스트</h2>
<hr>
<div id="sns">

</div>


<a href="/sns/insertsnsform">sns 등록</a>
</body>
</html>
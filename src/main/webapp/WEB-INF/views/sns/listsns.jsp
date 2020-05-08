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
	var arr_file = ${file};
	var arr_board = ${board};
// 	console.log(arr_file);
	$.each(arr_file,function(idx,data){
		console.log(data.photo_file_name);
// 		var a = $("<a></a>").attr("href","/sns/detail/photo_no="+img.attr("photo_no"));
		var img = $("<img/>").attr({"src":"/img/"+data.photo_file_name,"photo_no":data.photo_no});
		$("#sns").append(img);

		$(img).on("click",function(){
			var d = {photo_no:img.attr("photo_no")};
// 			location.href="/sns/detail?photo_no="${d};
// 			alert(img.attr("photo_no"));

			});
		
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
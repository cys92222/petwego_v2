<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지- 로그기록</title>
<!-- 민아) 5/19, 관리자페이지 하는중  -->
<style type="text/css">
	li {list-style: none; float: left; padding: 6px;}	<!--페이징 가로정렬 스타일 -->
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
	//구글 차트 api 로딩 메소드 
	google.charts.load('current', {'packages' : [ 'corechart' ]});

	//로딩되면 차트 그리는 메소드 
	google.charts.setOnLoadCallback(drawChart);

	var list; //전역변수로 둠 , 통신하고나서도 사용해야하니까!
	$.ajax({
			type:"GET",
			contentType:"application/json; charset=utf-8",
			dataType : "JSON",
			url : "/management/chartLog",
			success:function(re) {	

				// 여기가 문제였음! parseJSON을 해줘야함. 전에 dept 이런걸로 할때는 필요없었는데 뭐징...
				list = $.parseJSON(re);
				
			}})
		
	 function drawChart() {

		// 실 데이터를 가진 데이터 테이블 객체를 반환 
        var data = new google.visualization.DataTable();

        data.addColumn('string', 'Topping');
		data.addColumn('number', 'Slices');
		
		
		// 반복문 돌면서 url, count를 구글차트data에 넣어줌 
		$.each(list, function(idx, item) {
			data.addRows([ [ item.url, item.count ],//여기에 들어가는 값이 차트에 보여짐! 
			]);	//반복문 수행시 item 은 하나의 vo같은것. 즉 0번째vo 1번째vo...등!
		})
		
		
		// 옵션 객체, title은 차트위에 제목처럼 뜨는 것 
        var options = {
			'title' : '이용량이 많은 페이지',
			'width' : 600,
			'height' : 500
        };

		// div영역에 차트를 그릴 수 있는 차트객체 반환
       	var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        // 데이터와 옵션객체를 전달하여 차트 그림
        chart.draw(data, options);
      }
</script>
</head>
<body>

	<h1>로그관리</h1>
	<hr>
	<a href="/management/manager_main">관리자페이지 메인</a><br>
	<div id="chart_div"></div>
	<hr>
	<table border="1" width="70%">
		<thead>
			<tr>
				<th>로그번호</th>
				<th>url</th>
				<th>ip</th>
				<th>시간</th>
				<th>아이디</th>
			</tr>
		</thead>
											
		<tbody>
		<c:forEach var="logg" items="${listLog }">
			<tr>
				<td><c:out value="${logg.log_num }"/></td>
				<td><c:out value="${logg.url }"/></td>
				<td><c:out value="${logg.ip }"/></td>
				<td>
				<c:out value="${logg.time }"/>
				</td>
				<td><c:out value="${logg.user_id }"/></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<hr>
	<div>
  <ul>
    <c:if test="${pageMaker.prev}">
    	<li><a href="listLog${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    	<li><a href="listLog${pageMaker.makeQuery(idx)}">${idx}</a></li>
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    	<li><a href="listLog${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>사람 정보 수정</h2>
<hr>
<form action="/mypage/people_info_up" method="post">
아이디 <input type="text" value="${m.user_id }" readonly="readonly" name="user_id"><br>
닉네임 <input type="text" value="${m.nick_name }" name="nick_name"><br>
비밀번호를 입력하셔야 정보를 수정할수있습니다<br>
비밀번호 <input type="text" name="pwd" required="required"><br>
<button>비밀번호 변경</button><br>
전화번호 <input type="text" value="${m.tel }" name="tel"><br>
<%-- 생일 <input type="text" value="${m.birth }" name="birth"><br> --%>
이름 <input type="text" value="${m.name }" name="name"><br>
주소 <input type="text" value="${m.address }" name="address"><br>
성별 <input type="text" value="${m.gender }" name="gender"><br>
사진 <br>
소개 <input type="text" value="${m.intro }" name="intro"><br>
가입일 <input type="text" value="${m.info_create_date }" readonly="readonly"><br>
<button>수정</button>
</form>
</body>
</html>
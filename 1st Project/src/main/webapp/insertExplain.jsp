<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="InsertExplain">
		<select name="lang">
	  		<option value="파이썬">파이썬</option>
	 		<option value="자바">자바</option>
	  		<option value="HTML">HTML/CSS</option>
	  		<option value="자바스크립트">자바스크립트</option>
		</select>
		<!-- <input name="lang" type="text", placeholder="언어입력"> -->
		<div><input name="seq" type="number" placeholder="문제번호"></div>
		<div>
			<div><input name="id" type="text", placeholder="id입력" value="admin"></div>
			<div><textarea rows="2" cols="100" name="coding_explain_subject" placeholder="개념 제목 넣기"></textarea></div>
			<div><textarea rows="20" cols="100" name="coding_explain_content" placeholder="개념 내용 넣기"></textarea></div>
			<div><input type="submit" value="넣기">
			<a href="InsertCoding.jsp">문제 넣으러 가기</a>
			<a href="StudyPage.jsp">문제 확인하러 가기</a>
		</div>
	</form>
</body>
</html>
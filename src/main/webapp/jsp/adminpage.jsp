<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/style.css" rel="stylesheet">
<title>Admin page</title>
</head>
<body class="admin">
	<div class="adminpage">
	Welcome, ${username}
	<h2>Admin menu</h2>
	<a href='/showcandidates'>Show all candidates</a><br>
	<a href='addcandidates.jsp'>Add candidate</a><br>
	<a href='addquestions.jsp'>Add questions</a><br>
		<a href='/service/QuestionService/readquestion'>Show all questions</a><br>
	
	<br>
	<form action="/logout">
		<input type="submit" value="Logout">
	</form>
	</div>
</body>
</html>
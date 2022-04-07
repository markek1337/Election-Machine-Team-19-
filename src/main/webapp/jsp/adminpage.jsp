<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin page</title>
</head>
<body>
	Welcome, ${username}
	<h2>Admin menu</h2>
	<a href='/showcandidates'>Show all candidates</a><br>
	<a href='addcandidates.jsp'>Add candidate</a><br>
	
	<form action="/logout">
		<input type="submit" value="logout">
	</form>
</body>
</html>
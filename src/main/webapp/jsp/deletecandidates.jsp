<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team19.adminfeatures.Candidates" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Candidate</title>
</head>
<body>

	<p>Delete a record</p>
	<form action='/deletecandidates' method='post'>
		<input type="hidden" name="id" value="${sessionScope.game.id }">
		<input type='submit' name='ok' value='Delete'>
	</form>

</body>
</html>
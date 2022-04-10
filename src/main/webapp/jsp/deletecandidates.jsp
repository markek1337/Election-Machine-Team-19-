<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="team19.adminfeatures.Candidates" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Candidate</title>
<%@ include file="header.jsp" %>
</head>
<body>

	<br><br><br><p>Delete a record</p>
	<form action='/deletecandidates' method='post'>
		<input type="hidden" name="id" value="${sessionScope.candidate.id }">
		<input type='submit' name='ok' value='Delete'>
	</form>

</body>
</html>
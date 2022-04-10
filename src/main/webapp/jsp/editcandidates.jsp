<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="team19.adminfeatures.Candidates" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="../css/style.css" rel="stylesheet">
<title>Edit Candidates</title>
</head>
<body class="editcandidates">
<div class="editcandidatesform">
	<form action='/editcandidates' method='post'>
		<h3>Name:</h3><br> <input type='text' name='name' value='${sessionScope.candidate.name }'><br>
		<h3>Surname:</h3><br> <input type='text' name='surname' value='${sessionScope.candidate.surname }'><br>
		<h3>Party:</h3><br> <input type='text' name='party' value='${sessionScope.candidate.party }'><br>
		<h3>City:</h3><br> <input type='text' name='homecity' value='${sessionScope.candidate.homecity }'><br>
		<h3>Description:</h3><br> <input type='text' name='description' value='${sessionScope.candidate.description }'><br>
		<h3>Idea:</h3><br> <input type='text' name='idea' value='${sessionScope.candidate.idea }'><br>
		<h3>Occupation:</h3><br> <input type='text' name='occupation' value='${sessionScope.candidate.occupation }'><br>
		<input type="hidden" name="id" value="${sessionScope.candidate.id }">	
		<input type='submit' name='ok' value='Edit'>
	</form>
</div>
</body>
</html>
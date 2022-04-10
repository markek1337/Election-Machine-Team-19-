<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="team19.adminfeatures.Candidates" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Candidates</title>
<%@ include file="header.jsp" %>
</head>
<body>

	<br><br><br><form action='/editcandidates' method='post'>
		Name: <input type='text' name='name' value='${sessionScope.candidate.name }'><br>
		Surname: <input type='text' name='surname' value='${sessionScope.candidate.surname }'><br>
		Party: <input type='text' name='party' value='${sessionScope.candidate.party }'><br>
		City: <input type='text' name='homecity' value='${sessionScope.candidate.homecity }'><br>
		Description: <input type='text' name='description' value='${sessionScope.candidate.description }'><br>
		Idea: <input type='text' name='idea' value='${sessionScope.candidate.idea }'><br>
		Occupation: <input type='text' name='occupation' value='${sessionScope.candidate.occupation }'><br>
		<input type="hidden" name="id" value="${sessionScope.candidate.id }">	
		<input type='submit' name='ok' value='Edit'>
	</form>

</body>
</html>
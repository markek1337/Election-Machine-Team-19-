<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="team19.adminfeatures.Candidates" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Candidates</title>
</head>
<body>

	<form action='/editcandidates' method='post'>
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
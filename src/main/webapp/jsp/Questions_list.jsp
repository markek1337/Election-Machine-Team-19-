<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Questions</title>
</head>
<body>
<table>
<tr>
	<th>ID</th>
	<th>Question</th>
</tr>
<c:forEach var="QUESTIONS" items="${requestScope.questionlist }">
	<tr>
	<td>${QUESTIONS.QUESTION_ID}</td>
	<td>${QUESTIONS.QUESTION}</td>
	<td><a href="../QuestionService/deletequestion/${QUESTIONS.QUESTION_ID }"onclick="return window.confirm('Are you sure?');">Delete</a> </td>
	
	</tr>
</c:forEach>
</table>
</body>
</html>
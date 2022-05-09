<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Questions</title>

</head>
<body>
<form action='/service/QuestionService/addquestion' method='post'>
<input type='text' name='QUESTION' value=''>
<input type='submit' name='ok' value='OK'>
</form>
<ol>
<c:forEach var="QUESTIONS" items="${requestScope.questionlist }">
    <li>${QUESTIONS} <a href='../delete?QUESTION_id=${QUESTIONS.QUESTION_id}'>Delete</a> <a href='../readtoupdatequestion?QUESTION_id=${QUESTIONS.QUESTION_id}'>Update</a>
</c:forEach>
</ol>
</body>
</html>
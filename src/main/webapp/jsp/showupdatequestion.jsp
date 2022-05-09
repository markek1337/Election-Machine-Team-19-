<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update question</title>
</head>
<body>
<form action='/service/QuestionService/updatequestion' method='post'>
Confirm Question Id: <input type='text' name='question_id' value='${requestScope.QUESTION_ID}'>
Question: <input type='text' name='question' value='${requestScope.QUESTION_ID}'>
<input type="submit" value="Ok">
</form>
<c:forEach var="questions" items="${requestScope.updatedquestionlist }">
	
</c:forEach>
</body>
</html>
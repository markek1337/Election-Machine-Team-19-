<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Questions</title>
<style>
#QUESTIONS {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#QUESTIONS th, #QUESTIONS td {
  text-align: left;
  padding: 12px;
}

#QUESTIONS tr {
  border-bottom: 1px solid #ddd;
}

#QUESTIONS tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
  }
  th {
  cursor: pointer;
}
th:hover {
  background-color: #dddddd;
}

.showquestions input[type="submit"] {
  width: 12%;
  height: 40px;
  border: 1px solid;
  background: #2691d9;
  font-size: 14px;
  color: #e9f4fb;
  font-weight: 700;
  cursor: pointer;
}
</style>
</head>
<body>
<div class="showquestions">
<table id="QUESTIONS">
<tr class="header">
	<th>ID</th>
	<th>Question</th>
	<th>Option</th>
</tr>
<c:forEach var="QUESTIONS" items="${requestScope.questionlist }">
	<tr>
	<td>${QUESTIONS.QUESTION_ID}</td>
	<td>${QUESTIONS.QUESTION}</td>
	<td><a href="../QuestionService/deletequestion/${QUESTIONS.QUESTION_ID }"onclick="return window.confirm('Are you sure?');">Delete</a> </td>
	<td><a href="../QuestionService/readtoupdatequestion/${QUESTIONS.QUESTION_ID }">Edit</a> </td>
	</tr>
</c:forEach>
</table>
	<br>
	<form action="/jsp/adminpage.jsp">
		<input type="submit" value="Back to admin page">
	</form>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="team19.adminfeatures.Candidates" %>
<%@ page import="java.util.ArrayList" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidates</title>
</head>
<body>
<table>
<tr>
	<th>ID</th>
	<th>Name</th>
	<th>Surname</th>
	<th>Actions</th>
</tr>
<c:forEach var="candidate" items="${sessionScope.allcandidates }">
	<tr>
		<td>${candidate.id }</td>
		<td>${candidate.name }</td>
		<td>${candidate.surname }</td>
		<td>
			<a href="/editcandidates?id=${candidate.id }">Edit</a>
		</td>
		<td>
			<a href="/deletecandidates?id=${candidate.id }">Delete</a>
		</td>
		<td>
			<a href="/candidatesinfo?id=${candidate.id }">See more</a>
		</td>
</c:forEach>
</table>

<a href='jsp/adminpage.jsp'>Back to admin page</a><br>

</body>
</html>
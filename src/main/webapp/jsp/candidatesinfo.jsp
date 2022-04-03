<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="team19.candidatesinfo.CandidatesInfo" %>
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
<!-- 	<th>ID</th> -->
	<th>Name</th>
	<th>Surname</th>
	<th>Party</th>
	<th>City</th>
	<th>Description</th>
	<th>Idea</th>
	<th>Occupation</th>
</tr>
<%-- <c:forEach var="candidate" items="${sessionScope.allcandidates }"> --%>
	<tr>
<%-- 		<td>${candidate.id }</td> --%>
		<td>${candidate.name }</td>
		<td>${candidate.surname }</td>
		<td>${candidate.party }</td>
		<td>${candidate.homecity }</td>
		<td>${candidate.description }</td>
		<td>${candidate.idea }</td>
		<td>${candidate.occupation }</td>
<%-- </c:forEach> --%>
</table>

</body>
</html>
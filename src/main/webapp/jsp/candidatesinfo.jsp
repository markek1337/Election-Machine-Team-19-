<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="team19.candidatesinfo.CandidatesInfo" %>
<%@ page import="java.util.ArrayList" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
td:nth-of-type(1) {

display: none;

}  
#myInput {
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

#candidates {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#candidates th, #candidates td {
  text-align: left;
  padding: 12px;
}

#candidates tr {
  border-bottom: 1px solid #ddd;
}

#candidates tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
  }
  th {
  cursor: pointer;
}
th:hover {
  background-color: #dddddd;
}
</style>
<title>Candidates</title>
<%@ include file="header.jsp" %>
</head>
<body>

<table id="candidates">
<tr class="header">
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
		<td>${candidate.id }</td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="team19.adminfeatures.Candidates" %>
<%@ page import="java.util.ArrayList" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>

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

.showcandidates input[type="submit"] {
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

<title>Candidates</title>
</head>
<body>
<div class="showcandidates">
<table id="candidates">
<tr class="header">
	<th>ID</th>
	<th>Name</th>
	<th>Surname</th>
	<th>Edit</th>
	<th>Delete</th>
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
</c:forEach>
</table>
	<br>
	<form action="jsp/adminpage.jsp">
		<input type="submit" value="Back to admin page">
	</form>
</div>
</body>
</html>
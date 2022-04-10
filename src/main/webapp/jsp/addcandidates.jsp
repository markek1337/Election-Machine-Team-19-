<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/style.css" rel="stylesheet">
<title>Add candidates</title>
</head>
<body class="addcandidates">
<div class="addcandidatesform">
	<form action="/addcandidates" method="post">
	
    	<h3>Surname:</h3> <input type="text" name="surname"><br>
    	<h3>First Name:</h3> <input type="text" name="firstname"><br>
    	<h3>Party:</h3> <input type="text" name="party"><br>
    	<h3>Location:</h3> <input type="text" name="location"><br>
    	<h3>Age:</h3> <input type="number" name="age"><br>
    	<h3>Reason:</h3> <input type="text" name="reason"><br>
    	<h3>Goals:</h3> <input type="text" name="goals"><br>
    	<h3>Profession:</h3> <input type="text" name="profession"><br>
    	
    	<input type="submit" value="Add">
    	
    </form>
	</div>
</body>
</html>
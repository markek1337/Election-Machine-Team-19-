<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add candidates</title>
</head>
<body>
	
	<form action="/addcandidates" method="post">
	
    	Surname: <input type="text" name="surname"><br>
    	First Name: <input type="text" name="firstname"><br>
    	Party: <input type="text" name="party"><br>
    	Location: <input type="text" name="location"><br>
    	Age: <input type="number" name="age"><br>
    	Reason: <input type="text" name="reason"><br>
    	Goals: <input type="text" name="goals"><br>
    	Profession: <input type="text" name="profession"><br>
    	
    	<input type="submit" value="Add">
    	
    </form>
	
</body>
</html>
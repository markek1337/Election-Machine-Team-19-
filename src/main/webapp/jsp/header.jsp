<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>

</style>
<title>Insert title here</title>


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>
<!-- <nav class="navbar navbar-default navbar-fixed-top"> -->
<!--   <div class="navbar-header"> -->
<!--     <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#resNav"> -->
<!--       <span class="icon-bar"></span> -->
<!--       <span class="icon-bar"></span> -->
<!--       <span class="icon-bar"></span> -->
<!--     </button> -->
<!--     <a href="#" class="navbar-brand">Election Machine</a> -->
<!--   </div> -->
<!--   <div class="collapse navbar-collapse" id="resNav"> -->
<!--     <ul class="nav navbar-nav navbar-right"> -->
<!--       <li><a href="/">Home</a></li> -->
<!--       <li><a href='html/login.jsp'>Login</a></li> -->
<!--       <li><a href='/showcandidates'>Show all candidates</a></li> -->
<!--       <li><a href='/ShowQuestions'>Answer the questions</a></li> -->
<!--     </ul> -->
<!--   </div> -->
<!-- </nav>  End of Navigation Bar -->
<nav class="navbar navbar-inverse" style="margin-bottom: 0px;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/">Election Machine</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="/">Home</a></li>
      <li><a href='/showcandidatesforuser'>Show all candidates</a></li>
      <li><a href='/ShowQuestions'>Answer the questions</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="jsp/register.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="html/login.jsp"><span class="glyphicon glyphicon-log-in"></span> Admin Login</a></li>
    </ul>
  </div>
</nav>

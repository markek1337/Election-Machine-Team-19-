<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
  <head>
    <meta http-equiv="content-type" content="application/xhtml+xml; charset=ISO-8859-1" />
    <title>Login</title>
	<%@ include file="/jsp/header.jsp" %>
	<link href="../css/style.css" rel="stylesheet">
  </head>

  <body class="loginpage">
  	<div class="loginform">
	<h1>Log In</h1>
  	<form action="/loginuser" method="get">
  		<div class="usr">
	    	<input type="text" name="username" placeholder="Username"><br>
    	</div>
    	<div class="pass">
	    	<input type="password" name="password" placeholder="Password"><br>
    	</div>
    	<div class="sendButton">
    		<input type="submit" name="send" value="Log In">
    	</div>
    </form>
    </div>
  </body>
</html>
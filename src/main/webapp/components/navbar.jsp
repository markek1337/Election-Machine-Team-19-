<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>



<% 
// init empty vars
String id = null;

// grab loginCookie info
Cookie[] login = request.getCookies();
if(login !=null){
for(Cookie i : login){
/*
* LoginServlet: loginCookie -> userName
*/
if(i.getName().equals("user")) id = i.getValue();
}
}
//AD - If there is an ID showing up, then it gives you a logout button.
if (id!=null) {
%>
  <div class="container-nav1">
    <div class="container-nav3">
       <div class="container-nav4">     
	 	<div class = "container-nav-links">
	         <a href="../ShowQuestions">Questionnaire</a>
	    </div>
	    
	     	<div class = "container-nav-links">
	         <input type="submit" value="Logout" >
	    </div>
      </div>
     </div>
   </div>
<%
}
else {
	%>
  <div class="container-nav1">
    <div class="container-nav3">
       <div class="container-nav4">       
		<div class = "container-nav-links">
	        <a href="../ShowQuestions">Questionnaire</a>
	    </div>     
	    <div class = "container-nav-links">
	    	<a href="../showcandidates">Candidates</a>
	    </div>
	    <div class = "container-nav-links">
	        <a href="/html/login.html">Login</a>
	    </div>
        
       </div>
     </div>
   </div>
     <%
}
%>

     



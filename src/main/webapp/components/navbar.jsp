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

 
         <a href="../ShowQuestions">Questionnaire</a>
         <a href="../ShowCandidates">Candidates</a>
         <input type="submit" value="Logout" >


<%
}
else {
	%>
        <a href="../ShowQuestions">Questionnaire</a>
        <a href="../ShowCandidates">Candidates</a>
        <a href="../loginPage.jsp">Login</a>
        
     <%
}
%>

     



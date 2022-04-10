<html lang="en">
<head>

    <%@ include file="../components/meta.jsp" %>
    <%@ page import="java.util.ArrayList" %>   
	<%@ page import="team19.data.Question" %>   
	<%@ page import="team19.data.Answer" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
     
    <title>Questionnaire Results</title>
    <%@ include file="header.jsp" %>
   
</head>
<body>
<%--    <%@ include file="../components/navbar.jsp" %>  --%>

        
        <br><br><br><h2>Your Results</h2>
       
	        <h5>Thank you for successfully completing our questionnaire!
	            <br><br>
	            Now you can see best candidates for you.
	            <br>           
	        </h5>
        

<%--                 <h6>Your answers (click to view):</h6>
          

                <input class = "buttonShowHide2 button1" id = "btnUserResults" 
                type="button" value="ANSWERS" onclick="ShowHideToggle4(this)" >                
--%>

            <br>
                
            <div id="dvUserResults" style="display: none">
				
				<c:forEach var="question" items="${requestScope.selectionList}" >
                <div class="containerUserAnswers">
          
                    <h5><c:out value = "${question.QId}/${fn:length(requestScope.selectionList)} - ${question.QTxt}"/>
                        <br><br>
                        Your answer (number): <c:out value = "${question.answer}"/>  
                    </h5>
         
                </div>
				</c:forEach>
                
            </div>
            

            <hr>        
            <div class="container7c">
                <h6 class = "textRestyle1">Your top candidate matches (click to view):</h6>
            </div>
        
                <div class="container3">
                    <input class = "buttonShowHide button1" id = "btnCandResults1" 
                    type="button" value="1st Place" onclick="ShowHideToggle1(this)" >           
                    
                    <input class = "buttonShowHide button1" id = "btnCandResults2" 
                    type="button" value="2nd Place" onclick="ShowHideToggle2(this)" >             

                    <input class = "buttonShowHide button1" id = "btnCandResults3" 
                    type="button" value="3rd Place" onclick="ShowHideToggle3(this)" >             

                </div>
                <br>        
                <div id="dvCandResults1" style="display: none">               
                    <div class="container6">         
                        <h5>1st Place Match:
                        <c:out value="${requestScope.profile_1st.FName} ${requestScope.profile_1st.SName} - ${requestScope.profile_1st.party}"></c:out>                  
                            <br>
                            <br>
                            <br>
                            <br>
                            
							Age: <c:out value="${requestScope.profile_1st.age}"></c:out>
							<br>
							Occupation: <c:out value="${requestScope.profile_1st.profession}"></c:out>
							<br>
                            Location: <c:out value="${requestScope.profile_1st.location}"></c:out>
                            <br>
                            <br>
                            Goals: <c:out value="${requestScope.profile_1st.goals}"></c:out>
                            <br><br>
                           	Reason: <c:out value="${requestScope.profile_1st.reason}"></c:out>
                           	<br>
                           	<br>
                           	<br>
                        </h5>                   
                        <div class="containerCompareResults"> 
                            <input class = "buttonShowHide3 button1" id = "btnCompareResults" 
                            type="button" value="COMPARE YOUR ANSWERS" onclick="ShowHideToggle5(this)" >                
                        </div>               
                    </div>  
                </div>  

	            <div id="dvCompareResults" style="display: none">
	
	                <div class="containerCompareAnswers">
	          
	                    <h5>Q1: "I think that parliament should do more for the environment..."
	                        <br><br>
	                        Your answer (number): 4    
	                    </h5>
	                    
	                </div>
	
	                <div class="containerCompareAnswers">
	
	                    <h5>Q2: "I think that parliament should do more for the environment..."
	                        <br><br>
	                        Your answer (number): 3    
	                    </h5>
	                </div>
	                
	                <div class="containerCompareAnswers">
	                   
	                    <h5>Q3: "I think that parliament should do more for the environment..."
	                        <br><br>
	                        Your answer (number): 1   
	                    </h5>
	                </div>               
	
	            </div>                   
                <div id="dvCandResults2" style="display: none">             
                    <div class="container6">         
                        <h5>2nd Place Match:
                        <c:out value="${requestScope.profile_2nd.FName} ${requestScope.profile_2nd.SName} - ${requestScope.profile_2nd.party}"></c:out>                  
                            <br>
                            <br>
                            <br>
                            <br>
                            
							Age: <c:out value="${requestScope.profile_2nd.age}"></c:out>
							<br>
							Occupation: <c:out value="${requestScope.profile_2nd.profession}"></c:out>
							<br>
                            Location: <c:out value="${requestScope.profile_2nd.location}"></c:out>
                            <br>
                            <br>
                            Goals: <c:out value="${requestScope.profile_2nd.goals}"></c:out>
                            <br><br>
                           	Reason: <c:out value="${requestScope.profile_2nd.reason}"></c:out>
                           	<br>
                           	<br>
                           	<br>
                        </h5>              
                        <div class="containerCompareResults"> 
                            <input class = "buttonShowHide3 button1" id = "btnCompareResults2" 
                            type="button" value="COMPARE YOUR ANSWERS" onclick="ShowHideToggle6(this)" >                
                        </div> 
                    </div>  
                </div>
                
	            <div id="dvCompareResults2" style="display: none">
	
	                <div class="containerCompareAnswers">
	          
	                    <h5>Q1: "I think that parliament should do more for the environment..."
	                        <br><br>
	                        Your answer (number): 4    
	                    </h5>
	                    
	                </div>
	
	                <div class="containerCompareAnswers">
	
	                    <h5>Q2: "I think that parliament should do more for the environment..."
	                        <br><br>
	                        Your answer (number): 3    
	                    </h5>
	                </div>
	                
	                <div class="containerCompareAnswers">
	                   
	                    <h5>Q3: "I think that parliament should do more for the environment..."
	                        <br><br>
	                        Your answer (number): 1   
	                    </h5>
	                </div>               
	
	            </div>  
                <div id="dvCandResults3" style="display: none">    
                                    <div class="container6">         
                        <h5>3rd Place Match:
                        <c:out value="${requestScope.profile_3rd.FName} ${requestScope.profile_3rd.SName} - ${requestScope.profile_3rd.party}"></c:out>                  
                            <br>
                            <br>
                            <br>
                            <br>
                            
							Age: <c:out value="${requestScope.profile_3rd.age}"></c:out>
							<br>
							Occupation: <c:out value="${requestScope.profile_3rd.profession}"></c:out>
							<br>
                            Location: <c:out value="${requestScope.profile_3rd.location}"></c:out>
                            <br>
                            <br>
                            Goals: <c:out value="${requestScope.profile_3rd.goals}"></c:out>
                            <br><br>
                           	Reason: <c:out value="${requestScope.profile_3rd.reason}"></c:out>
                           	<br>
                           	<br>
                           	<br>
                        </h5>                                     
       
                        <div class="containerCompareResults"> 
                            <input class = "buttonShowHide3 button1" id = "btnCompareResults3" 
                            type="button" value="COMPARE YOUR ANSWERS" onclick="ShowHideToggle7(this)" >                
                        </div> 
                    </div>  
                </div>
            
                <hr>
	            <div id="dvCompareResults3" style="display: none">
	
	                <div class="containerCompareAnswers">
	          
	                    <h5>Q1: "I think that parliament should do more for the environment..."
	                        <br><br>
	                        Your answer (number): 4    
	                    </h5>
	                    
	                </div>
	
	                <div class="containerCompareAnswers">
	
	                    <h5>Q2: "I think that parliament should do more for the environment..."
	                        <br><br>
	                        Your answer (number): 3    
	                    </h5>
	                </div>
	                
	                <div class="containerCompareAnswers">
	                   
	                    <h5>Q3: "I think that parliament should do more for the environment..."
	                        <br><br>
	                        Your answer (number): 1   
	                    </h5>
	                </div>               
	
	            </div> 
 




                <button class="button-main button1" onclick="window.location.href='/ShowQuestions'"><b>Restart</b></button>
                


        

    
                <script type="text/javascript">
                    function ShowHideToggle1(btnCandResults1) {
                        var dvCandResults1 = document.getElementById("dvCandResults1");
                        if (btnCandResults1.value == "1st Place") {
                            dvCandResults1.style.display = "block";
                            btnCandResults1.value = "HIDE";
                            btnCandResults1.style.backgroundColor = "#bfff00";
                            
                        } else {
                            dvCandResults1.style.display = "none";
                            btnCandResults1.value = "1st Place";
                            btnCandResults1.style.backgroundColor = "#ffbf00";                           
                        }
                    }
           
		            /* AD - This is the function for the ShowHideToggle 
		                for the 2nd Place Suitable Candidate */		          
                    function ShowHideToggle2(btnCandResults2) {
                        var dvCandResults2 = document.getElementById("dvCandResults2");
                        if (btnCandResults2.value == "2nd Place") {
                            dvCandResults2.style.display = "block";
                            btnCandResults2.value = "HIDE";
                            btnCandResults2.style.backgroundColor = "#bfff00";
                        } else {
                            dvCandResults2.style.display = "none";
                            btnCandResults2.value = "2nd Place";
                            btnCandResults2.style.backgroundColor = "#ffbf00";    
                        }
                    }
    


		            /* AD - This is the function for the ShowHideToggle 
		                for the 3rd Place Suitable Candidate */          
                    function ShowHideToggle3(btnCandResults3) {
                        var dvCandResults3 = document.getElementById("dvCandResults3");
                        if (btnCandResults3.value == "3rd Place") {
                            dvCandResults3.style.display = "block";
                            btnCandResults3.value = "HIDE";
                            btnCandResults3.style.backgroundColor = "#bfff00";
                        } else {
                            dvCandResults3.style.display = "none";
                            btnCandResults3.value = "3rd Place";
                            btnCandResults3.style.backgroundColor = "#ffbf00";    
                        }
                    }
       
                    function ShowHideToggle4(btnUserResults) {
                        var dvUserResults = document.getElementById("dvUserResults");
                        if (btnUserResults.value == "ANSWERS") {
                            dvUserResults.style.display = "block";
                            btnUserResults.value = "HIDE";
                            btnUserResults.style.backgroundColor = "#bfff00";
                        } else {
                            dvUserResults.style.display = "none";
                            btnUserResults.value = "ANSWERS";
                            btnUserResults.style.backgroundColor = "#ffbf00";    
                        }
                    }
      
                        function ShowHideToggle5(btnCompareResults) {
                        var dvCompareResults = document.getElementById("dvCompareResults");
                        if (btnCompareResults.value == "COMPARE YOUR ANSWERS") {
                            dvCompareResults.style.display = "block";
                            btnCompareResults.value = "HIDE";
                            btnCompareResults.style.backgroundColor = "#bfff00";                          
                        } else {
                            dvCompareResults.style.display = "none";
                            btnCompareResults.value = "COMPARE YOUR ANSWERS";
                            btnCompareResults.style.backgroundColor = "ffbf00";                         
                        }
                    }

                        function ShowHideToggle6(btnCompareResults2) {
                        var dvCompareResults2 = document.getElementById("dvCompareResults2");
                        if (btnCompareResults2.value == "COMPARE YOUR ANSWERS") {
                        	dvCompareResults2.style.display = "block";
                            btnCompareResults2.value = "HIDE";
                            btnCompareResults2.style.backgroundColor = "#bfff00";
                        } else {
                        	dvCompareResults2.style.display = "none";
                            btnCompareResults2.value = "COMPARE YOUR ANSWERS";
                            btnCompareResults2.style.backgroundColor = "ffbf00";    
                        }
                    }
                                   
                        function ShowHideToggle7(btnCompareResults3) {
                        var dvCompareResults3 = document.getElementById("dvCompareResults3");
                        if (btnCompareResults3.value == "COMPARE YOUR ANSWERS") {
                        	dvCompareResults3.style.display = "block";
                        	btnCompareResults3.value = "HIDE";
                        	btnCompareResults3.style.backgroundColor = "#bfff00";
                        } else {
                        	dvCompareResults3.style.display = "none";
                        	btnCompareResults3.value = "COMPARE YOUR ANSWERS";
                        	btnCompareResults3.style.backgroundColor = "ffbf00";    
                        }
                    }                              
                </script>
<%-- 	<%@ include file="../components/footer.jsp" %> --%>
</body>
</html>
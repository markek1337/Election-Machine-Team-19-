<html lang="en">
<head>

    
    <%@ page import="java.util.ArrayList" %>   
	<%@ page import="team19.data.Question" %>   
	<%@ page import="team19.data.Answer" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
     
    <title>Questionnaire Results</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
</head>
<body>


    <div class="container">

        <div class="container6"> 
        <h2>Your Results</h2>
        </div>
       
        <div class="container5">
	        <h5>Thank you for successfully completing our questionnaire!
	            This section covers your results.
	            <br><br>
				In this section we will try to find the best candidate for you.
	            <br>           
	        </h5>
        </div>
        

            <div class="container7b">
                <h6 class = "textRestyle1">Your answers (click to view):</h6>
            </div>  

            <div class="container3">

                <input class = "buttonShowHide2 button1" id = "btnUserResults" 
                type="button" value="ANSWERS" onclick="ShowHideToggle4(this)" >                

            </div>
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
                     

                <!-- AD - This 'hidden div' shows the 3rd place suitable candidate.
                        The div becomes visible once the '3rd Place Candidate'
                        button is pressed. Conversely, the div disappears once the
                        button is pressed again (toggle button).-->         
                <div id="dvCandResults3" style="display: none">    
                
                    <!-- AD - This section shows the top suitable candidate(s)-->
                    <div class="container6">         
                        <h5>3rd Place Match:
                        <c:out value="${requestScope.profile_3rd.FName} ${requestScope.profile_3rd.SName} - ${requestScope.profile_3rd.party}"></c:out>                  
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
 



        <div class="container2">           

		    
            <hr>      
    
            <div class="container3">

                <button class="button-main button1" onclick="window.location.href='/ShowQuestions'"><b>Restart</b></button>
                
                <button class="button-main button1"><a href="../index.html"><b>Home</b></a></button>

            </div>
        
        </div>

    </div>  


        
                <script type="text/javascript">
                    function ShowHideToggle1(btnCandResults1) {
                        var dvCandResults1 = document.getElementById("dvCandResults1");
                        if (btnCandResults1.value == "1st Place") {
                            dvCandResults1.style.display = "block";
                            btnCandResults1.value = "HIDE";
                            btnCandResults1.style.backgroundColor = "#E76F51";
                            
                        } else {
                            dvCandResults1.style.display = "none";
                            btnCandResults1.value = "1st Place";
                            btnCandResults1.style.backgroundColor = "#2A9D8F";                           
                        }
                    }
           
		            /* This is the function for the ShowHideToggle 
		                for the 2nd Place Suitable Candidate */		          
                    function ShowHideToggle2(btnCandResults2) {
                        var dvCandResults2 = document.getElementById("dvCandResults2");
                        if (btnCandResults2.value == "2nd Place") {
                            dvCandResults2.style.display = "block";
                            btnCandResults2.value = "HIDE";
                            btnCandResults2.style.backgroundColor = "#E76F51";
                        } else {
                            dvCandResults2.style.display = "none";
                            btnCandResults2.value = "2nd Place";
                            btnCandResults2.style.backgroundColor = "#2A9D8F";    
                        }
                    }
    


		            /* This is the function for the ShowHideToggle 
		                for the 3rd Place Suitable Candidate */          
                    function ShowHideToggle3(btnCandResults3) {
                        var dvCandResults3 = document.getElementById("dvCandResults3");
                        if (btnCandResults3.value == "3rd Place") {
                            dvCandResults3.style.display = "block";
                            btnCandResults3.value = "HIDE";
                            btnCandResults3.style.backgroundColor = "#E76F51";
                        } else {
                            dvCandResults3.style.display = "none";
                            btnCandResults3.value = "3rd Place";
                            btnCandResults3.style.backgroundColor = "#2A9D8F";    
                        }
                    }
       
            

		            /* This is the function for the ShowHideToggle 
		                for the User Results (answers) */             
                    function ShowHideToggle4(btnUserResults) {
                        var dvUserResults = document.getElementById("dvUserResults");
                        if (btnUserResults.value == "ANSWERS") {
                            dvUserResults.style.display = "block";
                            btnUserResults.value = "HIDE";
                            btnUserResults.style.backgroundColor = "#E76F51";
                        } else {
                            dvUserResults.style.display = "none";
                            btnUserResults.value = "ANSWERS";
                            btnUserResults.style.backgroundColor = "#0075ac";    
                        }
                    }


                      /* This is the function for the ShowHideToggle 
		                for the 1st compareResults (answers) */             
                        function ShowHideToggle5(btnCompareResults) {
                        var dvCompareResults = document.getElementById("dvCompareResults");
                        if (btnCompareResults.value == "COMPARE YOUR ANSWERS") {
                            dvCompareResults.style.display = "block";
                            btnCompareResults.value = "HIDE";
                            btnCompareResults.style.backgroundColor = "#E76F51";                          
                        } else {
                            dvCompareResults.style.display = "none";
                            btnCompareResults.value = "COMPARE YOUR ANSWERS";
                            btnCompareResults.style.backgroundColor = "purple";                         
                        }
                    }
                      
                      
                        /* This is the function for the ShowHideToggle 
		                for the compareResults (answers) */             
                        function ShowHideToggle6(btnCompareResults2) {
                        var dvCompareResults2 = document.getElementById("dvCompareResults2");
                        if (btnCompareResults2.value == "COMPARE YOUR ANSWERS") {
                        	dvCompareResults2.style.display = "block";
                            btnCompareResults2.value = "HIDE";
                            btnCompareResults2.style.backgroundColor = "#E76F51";
                        } else {
                        	dvCompareResults2.style.display = "none";
                            btnCompareResults2.value = "COMPARE YOUR ANSWERS";
                            btnCompareResults2.style.backgroundColor = "purple";    
                        }
                    }
                        
                        
                        /* This is the function for the 3rd ShowHideToggle 
		                for the compareResults (answers) */             
                        function ShowHideToggle7(btnCompareResults3) {
                        var dvCompareResults3 = document.getElementById("dvCompareResults3");
                        if (btnCompareResults3.value == "COMPARE YOUR ANSWERS") {
                        	dvCompareResults3.style.display = "block";
                        	btnCompareResults3.value = "HIDE";
                        	btnCompareResults3.style.backgroundColor = "#E76F51";
                        } else {
                        	dvCompareResults3.style.display = "none";
                        	btnCompareResults3.value = "COMPARE YOUR ANSWERS";
                        	btnCompareResults3.style.backgroundColor = "purple";    
                        }
                    }        
                      
                </script>
</body>
</html>
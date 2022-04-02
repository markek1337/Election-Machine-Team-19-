
   
<%@ page import="java.util.ArrayList" %>   
<%@ page import="team19.data.Question" %>   
<%@ page import="team19.data.Answer" %>

 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../components/meta.jsp" %>    
    <title>Questionnaire</title>
   <%@ include file="../components/header.jsp" %>     
    
</head>
<body>
   <%@ include file="../components/navbar.jsp" %> 
 
            <h2>Election Machine</h2>
            <h5>This election machine contains 19 questions.
                Answer them all to find out which candidate suits you best!</h5>
        <hr> 
        
            <h5>1 = strongly disagree / 2 = disagree / 3 = neither agree nor disagree / 4 = agree / 5 = strongly agree</h5>
        <hr>     
            <form id="form" action="/SubmitAnswer" method="POST">				
               
                <br>                 
	            
	            

            
					<span id="spnError" class="error" style="display: none">Please select.</span>
                     

                    <button class="button-main button1 questionnaireButton" onclick="onStart()" id="start"><b>Start</b></button>                    
	                    
                        <c:forEach var="question" items="${requestScope.questionlist}" >
							
						<div style="display: none" id="q${question.id}">
						
					        	<h3><c:out value = "${question.id}/${fn:length(requestScope.questionlist)} - ${question.question}"/></h3> <!-- Display question -->
					   		
                                    
                                    <input hidden ="question_text" type = "text" name = "question_text${question.id}"  value="${question.question}">
                                                          
                                    <label class = "questionnaireSelect">
                                        <b class = "customText1">SELECT :</b>
                                    </label>
                                    <label> <b>(1)</b>
                                    <input type = "radio" name = "selected${question.id}"  value="1" required>
                                    </label>
                                    <label> <b>(2)</b>
                                    <input type = "radio" name = "selected${question.id}" value = "2" required>
                                    </label>
                                    <label> <b>(3)</b>
                                    <input type = "radio" name = "selected${question.id}" value = "3" required> <!-- checked ="checked" - FOR Testing purposes -->
                                    </label>
                                    <label> <b>(4)</b>
                                    <input type = "radio" name = "selected${question.id}" value = "4" required>
                                    </label>
                                    <label> <b>(5)</b>
                                    <input type = "radio" name = "selected${question.id}" value = "5" required>
                                    </label>                                                                                         
	        		   </div> 
	        		    </c:forEach>       		        		    
	       
				
						<button class="button-main button1 questionnaireButton" onclick="onPrev()" id="previous" style="display: none"><b>Previous</b></button>
						<button class="button-main button1 questionnaireButton" onclick="onNext()" id="next" style="display: none"><b>Next</b></button>
						<button class="button-main button1 questionnaireButton" onclick="toMain()" id="cancel" style="display: none"><b>Cancel</b></button>
						<button class="buttonSubmit button1" type="submit" id="submission" style="display: none"><b>Submit</b></button>                
				
				<br>  
				
            </form>           
		    
            <hr>      
                    
        							
    
	<%@ include file="../components/footer.jsp" %>

	<script type="text/javascript">
	
		document.getElementById("start").addEventListener("click", function(event){ //will prevent submission with these buttons
		event.preventDefault()});
	
		document.getElementById("next").addEventListener("click", function(event){
		event.preventDefault()});
		
		document.getElementById("previous").addEventListener("click", function(event){
		event.preventDefault()});
		
		document.getElementById("cancel").addEventListener("click", function(event){
			event.preventDefault()});
		
			
	// Variables:
		var collection_size = ${fn:length(requestScope.questionlist)};
		
		var q_id = 0; //Current block.
		var string = "q"; //String for the id tag.
		var div_id; //The questin div's ID.
		
		var q_id_prev; //The questin div's ID.
		var div_id_prev; //The previous ("on the right" or "on the left" => depends on which btn is used: N/P) questin div's ID.
		
		var radio = "selected";
		var radio_tag;
		var validator = false;
	
	// START button
		function onStart() 
		{	
			string = "q"; 
		    q_id += 1; 
			div_id = string + q_id
			
			// Prev block
			q_id_prev = q_id - 1;
			div_id_prev = string + q_id_prev;
			
		
		    
		    var div = document.getElementById(div_id); // Event Listener for question div.
			div.style.display = 'block';
		    
		    var div = document.getElementById("start"); // Event Listener for start btn => needs to be hidden on start.
			div.style.display = 'none';
		    
			var div = document.getElementById("next"); // Event Listener for next btn => needs to be displayed on start.
			div.style.display = 'block';
			
			
		};
		
	//NEXT button
		function onNext() 
		{	
		
			var isValid = false;
			
			var curr_q_id = q_id;
			radio = "selected";	
			radio_tag = radio + (curr_q_id);
			
			var rad = document.getElementsByName(radio_tag);
			
			for (var i = 0; i < rad.length; i++) {
	            if (rad[i].checked) {
	                isValid = true;
	                break;
	            }
	        }
			
			if(isValid == true)
			{
				string = "q"; //String for the id tag.
				
			    q_id += 1; // Displayed block.
				div_id = string + q_id
								
				q_id_prev = q_id - 1; // Prev block: div "on the left".
				div_id_prev = string + q_id_prev; // Prev block: div "on the left" => div id
				
				radio_tag = radio + (q_id - 1);
				//validator = false;
				
				var div = document.getElementById(div_id); // Event Listener for question div.
				if(q_id != collection_size + 1)
				{
					div.style.display = 'block';
				}
				
				
				var div = document.getElementById(div_id_prev); 
				div.style.display = 'none';
				
				var next = document.getElementById("next");
				var sbmt = document.getElementById("submission");
				var cancel = document.getElementById("cancel");
				if(q_id == collection_size + 1)
					{
					//alert("q_id = " + q_id + "collection_size = " + collection_size);
						next.style.display = 'none';
						sbmt.style.display = 'block';
						cancel.style.display = 'block'
					}

				var prev = document.getElementById("previous"); 
				if(q_id == collection_size + 1)
				{
					prev.style.display = 'none';
				}
				else if(q_id == 1)
				{
					prev.style.display = 'none';
				}
				else
				{
					prev.style.display = 'block';
				}
			}
			else
			{
				alert("Please select!");
			}
			
		};

	//NEXT button
		function onPrev() 
		{				
			string = "q" //String for the id tag
			
		    q_id -= 1; //Current block
			div_id = string + q_id //Div id for questions => q1, q2, q3, ...
			
			// Next block
			q_id_prev = q_id + 1; // Div block on the "right"
			div_id_prev = string + q_id_prev; // Div block on the "right" => div id			
		    
			var div = document.getElementById(div_id); // Event Listener for question div.
			div.style.display = 'block';
			
			var div = document.getElementById(div_id_prev); // Event Listener for the div "on the right".
			div.style.display = 'none';
			
			//alert("q_id = " + q_id + "collection_size = " + collection_size);
			var sbmt = document.getElementById("submission");
			sbmt.style.display = 'none';

			
			var nxt = document.getElementById("next");			
			if(q_id >= collection_size)
			{
				nxt.style.display = 'none';
			}
			else
			{
				nxt.style.display = 'block';
			}

			var prev = document.getElementById("previous");
			if(q_id == 1)
				{
					prev.style.display = 'none';
				}

		};
		
		function toMain()
		{
			window.location = "/index.html";
		}
	</script>


</body>
</html>


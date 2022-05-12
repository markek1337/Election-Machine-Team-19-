package service;
import java.io.IOException;
import java.util.List;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import app.QUESTIONS;

@Path("/QuestionService") //Root resource class path
public class QuestionService {
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("QUESTIONS"); // connection to db
	@Context HttpServletRequest request;
	@Context HttpServletResponse response;
	
	
	@GET //the method accepts only GET-type requests
	@Path("/readquestion") //path to this method
	@Produces(MediaType.APPLICATION_JSON) //media type method produces
	@Consumes(MediaType.APPLICATION_JSON) // media type method accepts
	public void readQUESTIONS() { 
		EntityManager em=emf.createEntityManager(); //manages entities given in persistence.xml
		em.getTransaction().begin();//starts the transaction 
		List<QUESTIONS> list=em.createQuery("select q from QUESTIONS q").getResultList();	//reads all the data from a database table QUESTIONS and getting list	
		em.getTransaction().commit();//close the transaction
		RequestDispatcher rd=request.getRequestDispatcher("/jsp/Questions_list.jsp"); //requestDispatcher allows forwarding a request response to a resource
		request.setAttribute("questionlist", list); //adds attribute to request to take to showquestions.jsp
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@GET //the method accepts only GET-type requests
    @Path("/deletequestion/{QUESTION_ID}") //setting QUESTION_ID as a parameter into URL
    @Produces(MediaType.APPLICATION_JSON) //media type method produces
    public void deleteQuestion(@PathParam("QUESTION_ID") int id) { 
        EntityManager em=emf.createEntityManager();
        em.getTransaction().begin();
        QUESTIONS a=em.find(QUESTIONS.class, id); //searches object id from database
        if (a!=null) {
            em.remove(a);//The actual insertion line
        }
        em.getTransaction().commit();
        //Calling the method readQUESTIONS() of this service
        readQUESTIONS();
        }
	
	@PUT
	@Path("/editquestions")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public void updateQuestions(QUESTIONS QUESTIONS) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		QUESTIONS k = em.find(QUESTIONS.class, QUESTIONS.getQUESTION_ID());
		if (k != null) {
			em.merge(QUESTIONS);//The actual update line
		}
		em.getTransaction().commit();
		//Calling the method readQUESTIONS() of this service
		readQUESTIONS();		
	}
	
	@GET
	@Path("/readtoupdatequestion/{QUESTION_ID}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public void readToUpdateQuestions(@PathParam("question_id") int QUESTION_ID) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		QUESTIONS k = em.find(QUESTIONS.class, QUESTION_ID);
		em.getTransaction().commit();
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/showupdatequestion.jsp");
		request.setAttribute("updatedquestionlist", k);
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	@POST
	@Path("/updatequestion")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes("application/x-www-form-urlencoded")
	public void updateQuestions(@FormParam("question") String question, @FormParam("question_id") int question_id) {  
		QUESTIONS k = new QUESTIONS(question, question_id);
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.merge(k);//The actual insertion line
		em.getTransaction().commit();
		//Calling the method readQUESTIONS() of this service
		readQUESTIONS();		
	}	
	
	@POST
    @Path("/addquestion")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes("application/x-www-form-urlencoded")
    public void addQUESTIONS(@FormParam("QUESTION") String QUESTION) {
        QUESTIONS q=new QUESTIONS(QUESTION);
        EntityManager em=emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(q);
        em.getTransaction().commit();
        readQUESTIONS();

}
}

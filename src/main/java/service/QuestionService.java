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
import javax.ws.rs.DELETE;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import app.QUESTIONS;

@Path("/QuestionService")
public class QuestionService {
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("QUESTIONS");
	@Context HttpServletRequest request;
	@Context HttpServletResponse response;
	
	
	@GET
	@Path("/readquestion")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public void readQUESTIONS() {
		EntityManager em=emf.createEntityManager();
		em.getTransaction().begin();
		List<QUESTIONS> list=em.createQuery("select q from QUESTIONS q").getResultList();		
		em.getTransaction().commit();
		RequestDispatcher rd=request.getRequestDispatcher("/jsp/Questions_list.jsp");
		request.setAttribute("questionlist", list);
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@GET
    @Path("/deletequestion/{QUESTION_ID}")
    @Produces(MediaType.APPLICATION_JSON)
    public void deleteQuestion(@PathParam("QUESTION_ID") int id) { 
        EntityManager em=emf.createEntityManager();
        em.getTransaction().begin();
        QUESTIONS a=em.find(QUESTIONS.class, id);
        if (a!=null) {
            em.remove(a);//The actual insertion line
        }
        em.getTransaction().commit();
        //Calling the method readAnswers() of this service

        }

		
}
package team19;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team19.dao.Dao;
import team19.data.Candidate;
import team19.data.Question;

/**
 * Servlet implementation class ShowQuestions which gets the questions from db
 * @author Edgar
 * @version 1.0
 */
@WebServlet("/ShowQuestions")
public class ShowQuestions extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Dao dao=null;
	
	@Override
	public void init() {
		dao=new Dao("jdbc:mysql://localhost:3306/vaalikone", "team19", "kukkuu");
		System.out.println("");
	}
	
       
    /**
     * @see HttpServlet#HttpServlet()
     * Constructor
     */
    public ShowQuestions() { 
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 * Takes the questions from the list
	 */ 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Question> list=null;
		if(dao.getConnection())
		{
			System.out.println("Successfully connected to the database");
			list=dao.readAllQuestion();
			System.out.println("Q-List: " + list);
			Question q = list.get(0);//
			
			System.out.println("Question id: " + q.getId());//
		}
		else
		{
			System.out.println("No connection to database");
		}
		request.setAttribute("questionlist", list);
		
		RequestDispatcher rd=request.getRequestDispatcher("/jsp/questionnaire.jsp");
		rd.forward(request, response);
	}
}

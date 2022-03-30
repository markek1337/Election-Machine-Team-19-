package team19;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team19.dao.Dao;
import data.Answers;


@WebServlet(
    name = "AddAnswer",
    urlPatterns = {"/addanswer"}
)
public class addanswer extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
		      throws IOException, ServletException {
		  doGet(request, response);
		//.... in the servlet's doPost method
		  Answers answer=readAnswers(request);
		  Dao dao=new Dao();
		  dao.saveAnswers(answer);
		  ArrayList<Answers> list=dao.readAllAnswers();
		  PrintWriter out = response.getWriter();
		  printAnswersList(out, list);
		  dao.close();
	  }
	  @Override
	  public void doGet(HttpServletRequest request, HttpServletResponse response) 
	      throws IOException, ServletException {
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();

			/*
			 * With a RequestDispatcher object is the htmlstart.html file included to this servlet
			 */
			RequestDispatcher rd=request.getRequestDispatcher("htmlstart.html");
			rd.include(request,  response);;

			out.println("<a href='./form.html'>Back to form</a>");


			rd=request.getRequestDispatcher("htmlend.html");
			rd.include(request,  response);;
	  }

	  /**
	   * 
	   * @param conn Connection to the database
	   * @param stmt Object to execute the sql commands
	   * @param breed breed of the game
	   * @param weight weight of the game
	   * @return number of inserted rows
	   * @throws SQLException
	   */
		
		private Answers readAnswers(HttpServletRequest request) {
			// TODO Auto-generated method stub
			Answers answers=new Answers();
			
			answers.setId(Integer.parseInt(request.getParameter("id")));
			answers.setQuestionID(Integer.parseInt(request.getParameter("KYSYMYS_ID")));
			answers.setAnswer(Integer.parseInt(request.getParameter("VASTAUS")));
			answers.setComments(request.getParameter("KOMMENTTI"));
			return answers;
		}
		private void printAnswersList(PrintWriter out, ArrayList<Answers> list) {
			out.println("<ul>");
			for (Answers g:list) {
				out.println("<li>"+g);
			}
			out.println("</ul>");
		}

	}
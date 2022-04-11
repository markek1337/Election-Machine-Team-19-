package team19.adminfeatures;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team19.dao.Dao;
import team19.adminfeatures.Candidates;

/**
 * This servlet is responsible for displaying all the candidates from the database.
 * @author markpetrov
 * @version 1.0
 */

@WebServlet(name = "ShowCandidates",
			urlPatterns = {"/showcandidates"}
			)

public class ShowCandidates extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// if sessions does not exist, create new one
		HttpSession session = request.getSession();
				
		Dao dao = new Dao();
		
		// creating an array 'candidates' which stores all the information about the candidates.
		ArrayList<Candidates> candidates = dao.readAllCandidates();
		
		session.setAttribute("allcandidates", candidates);
				
		RequestDispatcher rd = request.getRequestDispatcher("jsp/showcandidates.jsp");
		rd.forward(request, response);
		
		
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

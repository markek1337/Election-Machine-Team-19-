package team19.candidatesinfo;

import java.io.IOException;

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
 * Servlet showing information about candidate from database chosen by id
 * @author slava
 * @version 1.0
 */
@WebServlet(name = "CandidatesInfo",
			urlPatterns = {"/candidatesinfo"}
			)

public class CandidatesInfo extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// if sessions does not exist, create new one
		HttpSession session = request.getSession();
				
		String idValue = request.getParameter("id");
				
		if (idValue != null) {
			
			try {
				int id = Integer.parseInt(idValue);
						
				Dao dao = new Dao();
				Candidates candidate = dao.getCandidateInfo(id);
						
				session.setAttribute("candidate", candidate);
						
				RequestDispatcher rd = request.getRequestDispatcher("jsp/candidatesinfo.jsp");
				rd.forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			// Back to list
			response.sendRedirect("/showcandidates");
			
		}
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Create connection
		Dao dao=new Dao();
		Candidates candidate = readCandidate(request);
				
				
		dao.close();
				
		// Back to list after actions
		//RequestDispatcher rd = request.getRequestDispatcher("/showdata");
		//rd.forward(request, response);
		response.sendRedirect("/showcandidates");
	}
	
	private Candidates readCandidate(HttpServletRequest request) {
		
		Candidates candidate = new Candidates();
		
		candidate.setName(request.getParameter("name"));
		candidate.setSurname(request.getParameter("surname"));
		candidate.setParty(request.getParameter("party"));
		candidate.setHomecity(request.getParameter("homecity"));
		candidate.setDescription(request.getParameter("description"));
		candidate.setIdea(request.getParameter("idea"));
		candidate.setOccupation(request.getParameter("occupation"));
		candidate.setId(Integer.parseInt(request.getParameter("id")));
		
		return candidate;
		
	}
}

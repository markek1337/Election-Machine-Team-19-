package team19.adminfeatures;

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
 * This servlet is responsible for editing information about the candidate
 * @author markpetrov
 * @version 1.0
 */
@WebServlet(name = "EditCandidates",
			urlPatterns = {"/editcandidates"}
			)

public class EditCandidates extends HttpServlet {

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
						
				RequestDispatcher rd = request.getRequestDispatcher("jsp/editcandidates.jsp");
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
				
		dao.updateCandidates(candidate);
				
		dao.close();
		
		response.sendRedirect("/showcandidates");
	}
	
	/**
	 * This method assignes values from form to all candidates attributes.
	 * @param request
	 * @return
	 */
	private Candidates readCandidate (HttpServletRequest request) {
		
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

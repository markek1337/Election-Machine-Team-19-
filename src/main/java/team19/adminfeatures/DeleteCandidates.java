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



/**
 * This servlet is responsible for deleting candidates from database.
 * @author markpetrov
 * @version 1.0
 */
@WebServlet(
			name = "DeleteCandidates",
			urlPatterns = "/deletecandidates"
			)

public class DeleteCandidates extends HttpServlet {

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
						
				RequestDispatcher rd = request.getRequestDispatcher("jsp/deletecandidates.jsp");
				rd.forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			// Back to list
			response.sendRedirect("/showcandidates");
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Create connection
		Dao dao=new Dao();
		Candidates candidate = readCandidate(request);
				
		dao.deleteCandidate(candidate);
				
		dao.close();
		
		response.sendRedirect("/showcandidates");
		
	}
	
	/**
	 * This method is setting values from form to all candidates attributes.
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

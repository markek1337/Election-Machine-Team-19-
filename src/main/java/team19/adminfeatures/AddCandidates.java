package team19.adminfeatures;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team19.dao.Dao;

@WebServlet(
			name = "AddCandidates",
			urlPatterns = {"/addcandidates"}
			)

public class AddCandidates extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Dao dao = new Dao();
		
		String surname = request.getParameter("surname");
		String firstname = request.getParameter("firstname");
		String party = request.getParameter("party");
		String location = request.getParameter("location");
		int age = Integer.parseInt(request.getParameter("age"));
		String reason = request.getParameter("reason");
		String goals = request.getParameter("goals");
		String profession = request.getParameter("profession");
		
		dao.addCandidate(surname, firstname, party, location, age, reason, goals, profession);
		dao.close();
		
		response.sendRedirect("jsp/adminpage.jsp");
		
	}
}

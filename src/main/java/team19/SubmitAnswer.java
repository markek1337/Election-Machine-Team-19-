package team19;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team19.data.QAnswer;


/**
 * Servlet implementation class SubmitAnswer which gives you option to post answers from questionnaire
 * @author Edgar
 * @version 1.0
 */
@WebServlet("/SubmitAnswer")
public class SubmitAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;


	
	@Override
	public void init() {
		
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitAnswer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/**
		 * checks is user loged in as candidate or voter
		 */
		boolean isCandidate = false;;
		String id = null;
		
		Cookie[] login = request.getCookies();
		if(login !=null){
			for(Cookie i : login){
				if(i.getName().equals("user")) {
					isCandidate = true;
					id = i.getValue();
					System.out.println("login cookie: " + id);
					System.out.println("Candidate?: " + isCandidate);
					}
			}
		}

		/**
		 *  get client selection
		 */	
		ArrayList<QAnswer> selectionList= new ArrayList<QAnswer>(); // Empty ArrayList for the client's answers.
		
		for (int i = 1; i <= selectionList.size()+1; i++) {
			QAnswer qans = new QAnswer();
			String questionText = request.getParameter("question_text" + i);
			String selected = request.getParameter("selected" + i); // The client's selections will be saved and stored in QAnswer objects.


			
			if (selected != null) {
				System.out.println("CID: " +id);
				if(isCandidate) { qans.setCId(id); } // Candidate answers will be saved in DB => C_ID is required.
				qans.setQId(i);
				qans.setQTxt(questionText);
				qans.setAnswer(selected);
				selectionList.add(qans);
			}	
		}

		request.setAttribute("selectionList", selectionList);		


		/**
		 * If you are login as candidate
		 */
		if (isCandidate) {
			RequestDispatcher rd = request.getRequestDispatcher("");
			rd.forward(request, response);
			
		}

		/**
		 * If you are login as user/voter
		 */
		else {
			RequestDispatcher rd = request.getRequestDispatcher("/FindMatchingCandidates");
			rd.forward(request, response);
			}
	}
}
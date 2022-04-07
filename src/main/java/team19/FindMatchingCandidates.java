package team19;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.ListIterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team19.dao.Dao;
import team19.data.Candidate;
import team19.data.QAnswer;


@WebServlet("/FindMatchingCandidates")
public class FindMatchingCandidates extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Dao dao=null;
      
	@Override
	public void init() {
		dao=new Dao("jdbc:mysql://localhost:3306/vaalikone", "team19", "kukkuu");
		System.out.println("");
	}
	
    public FindMatchingCandidates() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
//	get answer from voters
		@SuppressWarnings("unchecked")
		ArrayList<QAnswer> selectionList = (ArrayList<QAnswer>) request.getAttribute("selectionList");
		
		

//	get candidate section answers
		ArrayList<QAnswer> answerList = returnCndAnswersStacked();

		
//	get candidates profiles	
		ArrayList<Candidate> candidateProfileStacked = returnCndProfileStacked();
		

//	questionnaire results prepare
		ArrayList<QAnswer> answerListScored = scoreStackedData(answerList, selectionList); //Will produce a "stacked" ArrayList containing all the QA objects with individual score values.
		ArrayList<QAnswer> scoreBoard = findBestCnds(answerListScored);
		
		int cndIdPole = getCndIdFromScoreBoard(1, scoreBoard);
		int cndIdSecond = getCndIdFromScoreBoard(2, scoreBoard);
		int cndIdThird = getCndIdFromScoreBoard(3, scoreBoard);
		
		ArrayList<QAnswer> result_1st = sliceFromStacked(cndIdPole, answerListScored);
		ArrayList<QAnswer> result_2nd = sliceFromStacked(cndIdSecond, answerListScored);
		ArrayList<QAnswer> result_3rd = sliceFromStacked(cndIdThird, answerListScored);
		
//	prepare profiles of candidates
		Candidate profile_1st = returnCndProfile(cndIdPole, candidateProfileStacked);
		Candidate profile_2nd = returnCndProfile(cndIdSecond, candidateProfileStacked);
		Candidate profile_3rd = returnCndProfile(cndIdThird, candidateProfileStacked);
		
		
//	send data to jsp file
		request.setAttribute("selectionList", selectionList);
		
		request.setAttribute("result_1st", result_1st);
		request.setAttribute("result_2nd", result_2nd);
		request.setAttribute("result_3rd", result_3rd);
		
		request.setAttribute("profile_1st", profile_1st);
		request.setAttribute("profile_2nd", profile_2nd);
		request.setAttribute("profile_3rd", profile_3rd);
		
		RequestDispatcher rd=request.getRequestDispatcher("/jsp/questionnaireResults.jsp");
		rd.forward(request, response);
	}
	
	
//	custom method
	public ArrayList<QAnswer> returnCndAnswersStacked()
	{
		ArrayList<QAnswer> answerList=null;
		if(dao.getConnection())
		{
			System.out.println("Successfully connected to the database");
			answerList=dao.readAllAnswers();
			System.out.println("Answer_List: " + answerList);
	
		}
		else
		{
			System.out.println("No connection to database");
		}
		return answerList;
	}
	
	public ArrayList<Candidate> returnCndProfileStacked()
	{
		ArrayList<Candidate> candidateProfileStacked=null;
		if(dao.getConnection())
		{
			System.out.println("Successfully connected to the database");
			candidateProfileStacked=dao.readAllCandidate();
			System.out.println("Can_List: " + candidateProfileStacked);
			

		}
		else
		{
			System.out.println("No connection to database");
		}
		return candidateProfileStacked;
	}
	
	public ArrayList<QAnswer> scoreStackedData(ArrayList<QAnswer> answerList, ArrayList<QAnswer> selectionList)
	{
		ArrayList<QAnswer> answerListScored= new ArrayList<QAnswer>(); // Will be returned at the end.
		ListIterator<QAnswer> iteratorCnd = answerList.listIterator(); // Will iterate through the ArrayList.
		ListIterator<QAnswer> iteratorClnt = selectionList.listIterator(); // Will iterate through the ArrayList.
		
		int cumulativeScore = 0;
		while (iteratorCnd.hasNext()) {
//	Iteration
			QAnswer cnd = new QAnswer();
			cnd = iteratorCnd.next(); // Will select the next object in the ArrayList and assign it to QAnswer object.
			
			QAnswer clnt = new QAnswer();
			if (iteratorClnt.hasNext()) {
				clnt = iteratorClnt.next(); // Will select the next object in the ArrayList and assign it to QAnswer object.
			}
			else
			{
				iteratorClnt = selectionList.listIterator(); // Will reset the iterator <= answerList is the "stacked" QAnswer ArrayList with all the Q/A data given by the candidates.
				clnt = iteratorClnt.next(); // Afterreset we continue the assessment.
				
				cumulativeScore = 0; // Will reset value for nect candidate.
			}
			
			if(cnd.getQId() == clnt.getQId()) { // Checks if question IDs are matching or not (Data integrity error!) 	
//	Scoring
				int score = Math.abs(cnd.getAnswer() - clnt.getAnswer());
				cnd.setScore(score); // Will store the absolut value of the diff between 2 answer values. => SCORE
				
				cumulativeScore = cumulativeScore + score; // Will calculate a cumulative score.
				if(clnt.getQId() == selectionList.size()) {cnd.setTotalScore(cumulativeScore);} // Cumulative score is the total score (ONLY!) for last QA object.
				else {cnd.setTotalScore(-1);}
				
//	Adding question text
				cnd.setQTxt(clnt.getQTxt());
				
//	Popular array list
				answerListScored.add(cnd); // Adding QA object to ArrayList.
			}
			else {
				System.out.println("Data integrity error at scoreStacked()! Question IDs are not matching.");
			}	
		}

		return answerListScored;		
	}
	
	public ArrayList<QAnswer> findBestCnds(ArrayList<QAnswer> scoredStackedData)
	{	
		ArrayList<QAnswer> cndScoreBoard = new ArrayList<QAnswer>();// Will be returned at the end.
		ArrayList<QAnswer> scoredStack = scoredStackedData; 
		ListIterator<QAnswer> iterator = scoredStack.listIterator(); // Will iterate through the ArrayList.
		
//	Drops false data			
		while(iterator.hasNext()) // Will remove "junk" (false) total score data (-1).
		{
			QAnswer object = new QAnswer();
			object = iterator.next();
			if(object.getTotalScore() >= 0) {
				cndScoreBoard.add(object);
			}
			else {

			}
		}

//	Sorting based on total score collected
        Collections.sort(cndScoreBoard, new Comparator<QAnswer>() { // Will organise elements into ascending order.
            @Override public int compare(QAnswer o1, QAnswer o2) {
                return o1.getTotalScore() - o2.getTotalScore(); }}); 
        
//		<<< Debugging Messages >>> 		
		for (int i = 0; i < cndScoreBoard.size(); i++) {
			System.out.println("scoring results: " + "CID: " + cndScoreBoard.get(i).getCId() + 
					", Total score: " + cndScoreBoard.get(i).getTotalScore());}
	
		return cndScoreBoard;
	}
	
	
	public int getCndIdFromScoreBoard(int rankAchieved, ArrayList<QAnswer> scoreBoard)
	{
		ArrayList<QAnswer> scBoard = scoreBoard;
		
		int ranking = rankAchieved -1;
		int candidateId;
		
		candidateId = scBoard.get(ranking).getCId();	
		
		return candidateId;	
	}
	
	
	public ArrayList<QAnswer> sliceFromStacked(int candidateId, ArrayList<QAnswer> scoredStackedData)
	{
		int cndId = candidateId;
		ArrayList<QAnswer> result = new ArrayList<QAnswer>();
		ArrayList<QAnswer> scoredStackedArrLi = scoredStackedData; 
		ListIterator<QAnswer> iterator = scoredStackedArrLi.listIterator(); // Will reset iterator.
		
		while(iterator.hasNext()) {
			QAnswer object = new QAnswer();
			object = iterator.next();
			
			if(object.getCId() == cndId) {
				result.add(object);
			}
		}
		
//		<<< Debugging Messages >>> 		
		for (int i = 0; i < result.size(); i++) {
			System.out.println("Cnd data sliced: " + "CID: " + result.get(i).getCId() + 
					", QID: " + result.get(i).getQId() + ", Score: " + result.get(i).getScore() + 
					", Total score: " + result.get(i).getTotalScore() + ", Q-TXT: " + result.get(i).getQTxt());}
		
		return result;
	}
	
	
	public Candidate returnCndProfile(int candidateId, ArrayList<Candidate> candidateProfileStacked)
	{
		int cndId = candidateId;
		ArrayList<Candidate> cndProfileStck = candidateProfileStacked; 
		ListIterator<Candidate> iterator = cndProfileStck.listIterator();
		
		Candidate profile = new Candidate();
		
		while(iterator.hasNext()) {
			Candidate temporary = new Candidate();
			temporary = iterator.next();
			
			if(temporary.getId() == cndId) {
				profile = temporary;
			}
		}	
		
			System.out.println("Candidate Profile: " + "CID: " + profile.getId() + " - Fname: " + profile.getFName());

		return profile;	
	}
}




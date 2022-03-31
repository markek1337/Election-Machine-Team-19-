package team19.data;

public class QAnswer {
	private int cId;
	private int qId;
	private int answer;
	private String questionTxt;
	private int score;
	private int totalScore;
	private Integer totalScoreInteger;
	
	public QAnswer(int can_id, int quest_id, int answer) {
		setCId(can_id);
		setQId(quest_id);
		this.answer=answer;
	}
	public QAnswer() {
	}
	
//set 
	public void setCId(int cId) {
		this.cId = cId;	
	}
	public void setCId(String cId) {
		this.cId = Integer.valueOf(cId);
		
	}
	
	public void setQId(int id) {
		this.qId = id;
	}
	public void setQId(String id) {
		this.qId = Integer.parseInt(id);
	}
	
	public void setAnswer(int answer) {
		this.answer = answer;
	}
	public void setAnswer(String answer) {
		this.answer = Integer.parseInt(answer);
	}
	
	public void setScore(int score) {
		this.score = score;
	}
	public void setTotalScore(int totalScore) { // Has to be calculated in the Servlet by summing each score.
		this.totalScore = totalScore; // Should be added to the last CANDIDATE object of the ArrayList.
	}
	public void setTotalScoreAsInteger(int totalScore) { 
		this.totalScoreInteger = Integer.valueOf(totalScore);
	}
	public void setQTxt(String questionText) {
		this.questionTxt = questionText;
		
	}
	
//get 
	public int getAnswer() {
		return answer;
	}
	public int getCId() {
		return cId;	
	}
	public int getQId() {
		return qId;	
	}
	public int getScore() {
		return score;
	}
	public int getTotalScore() { // Should be stored in the last CANDIDATE object of the ArrayList.
		return totalScore; 
	}
	public int getTotalScoreAsInteger() { 
		return totalScoreInteger; 
	}
	public String getQTxt() {
		return questionTxt;	
	}

	


}

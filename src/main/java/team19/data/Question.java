package team19.data;

public class Question {
	private int id;
	private String question;
	public Question(String id, String question) {
		// TODO Auto-generated constructor stub
		setId(id);
		this.question=question;
	}
	public Question() {
		System.out.println("Question() constructor");
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setId(String id) {
		try {
			this.id = Integer.parseInt(id);
		}
		catch(NumberFormatException | NullPointerException e) {
		}
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	
}


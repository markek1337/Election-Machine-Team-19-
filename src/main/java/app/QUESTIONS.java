package app;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class QUESTIONS implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int QUESTION_ID;
	private String QUESTION;
	
	public QUESTIONS() {
		super();
	}
	public int getQUESTION_ID() {
		return QUESTION_ID;
	}
	public void setQUESTION_ID(int QUESTION_ID) {
		this.QUESTION_ID = QUESTION_ID;
	}
	public String getQUESTION() {
		return QUESTION;
	}
	public void setQUESTION(String QUESTION) {
		this.QUESTION = QUESTION;
	}
	
	
	public String toString() {
		return QUESTION_ID+" "+QUESTION;
	}

}
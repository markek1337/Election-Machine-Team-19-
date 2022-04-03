package team19.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import team19.data.Answer;
import java.sql.Connection;

public class Dao_answer {

	
	private String url;
	private String user;
	private String pass;
	private Connection conn;
	
	
	// Getters
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	
	// Methods
	public Dao_answer(String url, String user, String pass) {

		System.out.println("Dao_answer constructor running with..\nurl: " + url + 
				"\nuser/pass: " + user + " / " + pass);
		this.url=url;
		this.user=user;
		this.pass=pass;
	}
	
	
	public boolean getConnection() {

		System.out.println("getConnection() running");
		try {
	        if (conn == null || conn.isClosed()) {
	            try {
	                Class.forName("com.mysql.jdbc.Driver").newInstance();
	            } catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
	                throw new SQLException(e);
	            }
	            conn = DriverManager.getConnection(url, user, pass);
	        }
	        System.out.println("Connected--" + url + "\nUser: " + user + " / " + pass);
	        return true;
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("Couldn't Connect--" + url + "\nUser: " + user + " / " + pass);
			return false;
		}
	}
	
	
	public ArrayList<Answer> readAllAnswer() {

		System.out.println("readAllAnswer() running");
		ArrayList<Answer> list=new ArrayList<>();
		try {
			Statement stmt=conn.createStatement();
			ResultSet RS=stmt.executeQuery("SELECT * FROM answers;");
			System.out.println("RS: " + RS);
			while (RS.next()){
				Answer a=new Answer();
				a.setCANDIDATE_ID(RS.getInt("CANDIDATE_ID"));
				a.setQUESTION_ID(RS.getInt("QUESTION_ID"));
				a.setANSWER(RS.getInt("ANSWER"));
				list.add(a);
			}
			return list;
		}
		catch(SQLException e) {
			System.out.println("Operation error readAllAnswer()--" + url + "\nUser: " + user + " / " + pass);
			return null;
		}
	}
	
	
	private ResultSet getString(String string) {
		// TODO Auto-generated method stub
		return null;
	}


	

	
	public Answer readAnswer(String CANDIDATE_ID) {

		Answer politician=null;
		try {
			String sql="SELECT * FROM answers WHERE CANDIDATE_ID=? ORDER BY QUESTION_ID;";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, CANDIDATE_ID);
			ResultSet RS=pstmt.executeQuery();
			while (RS.next()){
				politician=new Answer();
				politician.setQUESTION_ID(RS.getInt("QUESTION_ID"));
				politician.setANSWER(RS.getInt("ANSWER"));
			}
			System.out.println("Your lies are ready for processing:)");
			return politician;
		}
		catch(SQLException e) {
			System.out.println("Operation error deleteAnswer()--" + url + "\nUser: " + user + " / " + pass);
			return null;
		}
	}
}

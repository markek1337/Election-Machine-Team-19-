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
	

//get	
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

	
//set

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
			ResultSet RS=stmt.executeQuery("SELECT * FROM VASTAUKSET;");
			System.out.println("RS: " + RS);
			while (RS.next()){
				Answer a=new Answer();
				a.setCANDIDATE_ID(RS.getInt("EHDOKAS_ID"));
				a.setQUESTION_ID(RS.getInt("KYSYMYS_ID"));
				a.setANSWER(RS.getInt("VASTAUS"));
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

	public ArrayList<Answer> updateAnswer(Answer a) {

		System.out.println("updateAnswer running");
		try {
			String sql="UPDATE VASTAUKSET SET answer=? WHERE EHDOKAS_ID=? AND KYSYMYS_ID=?;";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, a.getANSWER());
			pstmt.setInt(2, a.getCANDIDATE_ID());
			pstmt.setInt(3, a.getQUESTION_ID());
			pstmt.executeUpdate();
			return readAllAnswer();
		}
		catch(SQLException e) {
			System.out.println("Operation error updateAnswer()--" + url + "\nUser: " + user + " / " + pass);
			return null;
		}
	}
	
	
	public ArrayList<Answer> deleteAnswer(String CANDIDATE_ID, String QUESTION_ID) {

		System.out.println("deleteAnswer() running");
		try {
			String sql="DELETE FROM VASTAUKSET WHERE EHDOKAS_ID=? AND KYSYMYS_ID=?;";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, CANDIDATE_ID);
			pstmt.setString(2, QUESTION_ID);
			pstmt.executeUpdate();
			System.out.println("answers table row with EHDOKAS_ID: " + CANDIDATE_ID + "and KYSYMYS_ID: "
					+ QUESTION_ID + " has been deleted successfully");
			return readAllAnswer();
		}
		catch(SQLException e) {
			System.out.println("Operation error deleteAnswer()--" + url + "\nUser: " + user + " / " + pass);
			return null;
		}
	}

	
	public Answer readAnswer(String CANDIDATE_ID) {

		Answer politician=null;
		try {
			String sql="SELECT * FROM VASTAUKSET WHERE EHDOKAS_ID=? ORDER BY KYSYMYS_ID;";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, CANDIDATE_ID);
			ResultSet RS=pstmt.executeQuery();
			while (RS.next()){
				politician=new Answer();
				politician.setQUESTION_ID(RS.getInt("KYSYMYS_ID"));
				politician.setANSWER(RS.getInt("VASTAUS"));
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

package team19.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import team19.data.Candidate;

import java.sql.Connection;


public class Dao_candidate {
	
	private String url;
	private String user;
	private String pass;
	private Connection conn;
	
	public Dao_candidate(String url, String user, String pass) {
		System.out.println("Dao(String url, String user, String pass) CONSTRUCTOR ******");
		this.url=url;
		this.user=user;
		this.pass=pass;
	}
	
	public boolean getConnection() {
//		System.out.println("getConnection()");
		try {
	        if (conn == null || conn.isClosed()) {
	            try {
	                Class.forName("com.mysql.jdbc.Driver").newInstance();
	            } catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
	                throw new SQLException(e);
	            }
	            conn = DriverManager.getConnection(url, user, pass);
	        }
	        return true;
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
			return false;
		}
	}

	public ArrayList<Candidate> readAllCandidate() { // Will read all cans in asc order
		ArrayList<Candidate> list=new ArrayList<>();
		try {
			Statement stmt=conn.createStatement();
			ResultSet RS=stmt.executeQuery("select * from candidates");
			while (RS.next()){
				Candidate c=new Candidate();
				c.setId(RS.getInt("CANDIDATE_ID"));
				c.setSName(RS.getString("SURNAME"));
				c.setFName(RS.getString("FIRSTNAME"));
				c.setParty(RS.getString("PARTY"));
				c.setLocation(RS.getString("LOCATION"));
				c.setAge(RS.getInt("AGE"));
				c.setReason(RS.getString("REASON_FOR_RUNNING"));
				c.setGoals(RS.getString("AIMS_AND_GOALS"));
				c.setProfession(RS.getString("PROFESSION"));
				list.add(c);
			}
			return list;
		}
		catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}	
}

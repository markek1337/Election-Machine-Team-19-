package team19.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import team19.data.QAnswer;

import java.sql.Connection;


public class Dao_qanswer {
	private String url;
	private String user;
	private String pass;
	private Connection conn;
	
	public Dao_qanswer(String url, String user, String pass) {
		System.out.println("Dao(String url, String user, String pass) CONSTRUCTOR ******");
		this.url=url;
		this.user=user;
		this.pass=pass;
	}
	
	public boolean getConnection() {
		System.out.println("getConnection()");
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
	public ArrayList<QAnswer> readAllAnswer() {
		System.out.println("readAllAnswer()");
		ArrayList<QAnswer> list=new ArrayList<>();
		try {
			Statement stmt=conn.createStatement();
			ResultSet RS=stmt.executeQuery("select * from answers");
			System.out.println("RS: " + RS);
			while (RS.next()){
				QAnswer a=new QAnswer();
				a.setCId(RS.getInt("CANDIDATE_ID"));
				a.setQId(RS.getInt("QUESTION_ID"));
				a.setAnswer(RS.getInt("ANSWER"));
				list.add(a);
			}
			return list;
		}
		catch(SQLException e) {
			return null;
		}
	}
}

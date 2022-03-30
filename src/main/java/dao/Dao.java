package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;



public class Dao {
	private Connection conn;
	public Dao() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn=java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/vaalikone", "team19", "kukkuu");
		} catch (SQLException | InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int saveAnswer(Answers answers) {
		Statement stmt=null;
		int count=0;
		try {
			stmt = conn.createStatement();
			count=stmt.executeUpdate("insert into user_VASTAUKSET(id, KYSYMYS_ID, VASTAUS, KOMMENTTI) values('"+answers.getId()+"', "+answers.getQuestionID()+","+answers.getAnswer()+","+answers.getComments()+")");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	public ArrayList<Answers> readAllAnswers() {
		ArrayList<Answers> list=new ArrayList<>();
		Statement stmt=null;
		int count=0;
		try {
			stmt = conn.createStatement();
			ResultSet rs=stmt.executeQuery("select * from user_VASTAUKSET");
			while (rs.next()) {
				Answers answers=new Answers();
				answers.setId(rs.getInt("id"));
				answers.setQuestionID(rs.getInt("KYSYMYS_ID"));
				answers.setAnswer(rs.getInt("VASTAUS"));
				answers.setComments(rs.getString("KOMMENTTI"));
				list.add(answers);
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}

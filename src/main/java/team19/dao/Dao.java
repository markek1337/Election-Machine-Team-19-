package team19.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import team19.adminfeatures.Candidates;

public class Dao {
	private Connection conn;

	public Dao() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/vaalikone", "team19", "kukkuu");
		} catch (SQLException | InstantiationException | IllegalAccessException | ClassNotFoundException e) {

			e.printStackTrace();
		}
	}
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	public void addUser (String username, String password, String salt) {

		String sql = "insert into useraccount (username, hashedpassword, salt) values (?, ?, ?)";
		
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, username);
			stmt.setString(2, password);
			stmt.setString(3, salt);
			
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String getUserSalt (String username) {
		
		String result = "";
		String sql = "select salt from useraccount where username = ?";
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, username);
			
			ResultSet rs = stmt.executeQuery();
			
			if (rs.next()) {
				result = rs.getString("salt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public String getUserPasswordHash (String username) {
		
		String result = "";
		String sql = "select hashedpassword from useraccount where username = ?";
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, username);
			
			ResultSet rs = stmt.executeQuery();
			
			if (rs.next()) {
				result = rs.getString("hashedpassword");
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	

	public int deleteCandidate (Candidates candidate) {
		
		int count = 0;
		String sql = "delete from CANDIDATES where CANDIDATE_ID = ?";
		
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, candidate.getId());
			
			count = stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public ArrayList<Candidates> readAllCandidates() {
		
		ArrayList<Candidates> list = new ArrayList<>();
		Statement stmt = null;
		
		try {
			
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from CANDIDATES");
			
			while (rs.next()) {
				
				Candidates candidate = new Candidates();
				candidate.setId(rs.getInt("CANDIDATE_ID"));
				candidate.setName(rs.getString("SURNAME"));
				candidate.setSurname(rs.getString("FIRSTNAME"));
				candidate.setParty(rs.getString("PARTY"));
				candidate.setHomecity(rs.getString("LOCATION"));
				candidate.setIka(rs.getInt("AGE"));
				candidate.setDescription(rs.getString("REASON_FOR_RUNNING"));
				candidate.setIdea(rs.getString("AIMS_AND_GOALS"));
				candidate.setOccupation(rs.getString("PROFESSION"));
				list.add(candidate);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Candidates getCandidateInfo(int id) {
		Candidates result = null;
		String sql = "select * from CANDIDATES where CANDIDATE_ID = ?";
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement(sql);
						
			stmt.setInt(1, id);
			
			ResultSet resultset = stmt.executeQuery();
			
			if (resultset.next()) {
				result = new Candidates();
				result.setId(resultset.getInt("CANDIDATE_ID"));
				result.setName(resultset.getString("SURNAME"));
				result.setSurname(resultset.getString("FIRSTNAME"));
				result.setParty(resultset.getString("PARTY"));
				result.setHomecity(resultset.getString("LOCATION"));
				result.setIka(resultset.getInt("AGE"));
				result.setDescription(resultset.getString("REASON_FOR_RUNNING"));
				result.setIdea(resultset.getString("AIMS_AND_GOALS"));
				result.setOccupation(resultset.getString("PROFESSION"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int updateCandidates(Candidates candidate) {
		int count = 0;
		String sql = "update CANDIDATES set SURNAME = ?, FIRSTNAME = ?, PARTY = ?, LOCATION = ?, AGE = ?, REASON_FOR_RUNNING = ?, AIMS_AND_GOALS = ?, PROFESSION = ? where CANDIDATE_ID = ?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, candidate.getName());
			stmt.setString(2, candidate.getSurname());
			stmt.setString(3, candidate.getParty());
			stmt.setString(4, candidate.getHomecity());
			stmt.setInt(5, candidate.getIka());
			stmt.setString(6, candidate.getDescription());
			stmt.setString(7, candidate.getIdea());
			stmt.setString(8, candidate.getOccupation());
			stmt.setInt(9, candidate.getId());
			
			count = stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
}

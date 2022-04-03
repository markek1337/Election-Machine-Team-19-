package team19.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import team19.adminfeatures.Candidates;
import team19.data.Answers;

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
	
	public int saveAnswers(Answers answers) {
		Statement stmt = null;
		int count= 0;
		try {
			stmt = conn.createStatement();
			count = stmt.executeUpdate("insert into user_VASTAUKSET(id, KYSYMYS_ID, VASTAUS, KOMMENTTI) values('"+answers.getId()+"', "+answers.getQuestionID()+","+answers.getAnswer()+","+answers.getComments()+")");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	public ArrayList<Answers> readAllAnswers() {
		ArrayList<Answers> list = new ArrayList<>();
		Statement stmt = null;
		int count = 0;
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from user_VASTAUKSET");
			while (rs.next()) {
				Answers answers = new Answers();
				answers.setId(rs.getInt("id"));
				answers.setQuestionID(rs.getInt("KYSYMYS_ID"));
				answers.setAnswer(rs.getInt("VASTAUS"));
				answers.setComments(rs.getString("KOMMENTTI"));
				list.add(answers);
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int deleteCandidate (Candidates candidate) {
		
		int count = 0;
		String sql = "delete from EHDOKKAAT where EHDOKAS_ID = ?";
		
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
			ResultSet rs = stmt.executeQuery("select * from EHDOKKAAT");
			
			while (rs.next()) {
				
				Candidates candidate = new Candidates();
				candidate.setId(rs.getInt("EHDOKAS_ID"));
				candidate.setName(rs.getString("ETUNIMI"));
				candidate.setSurname(rs.getString("SUKUNIMI"));
				candidate.setParty(rs.getString("PUOLUE"));
				candidate.setHomecity(rs.getString("KOTIPAIKKAKUNTA"));
				candidate.setIka(rs.getInt("IKA"));
				candidate.setDescription(rs.getString("MIKSI_EDUSKUNTAAN"));
				candidate.setIdea(rs.getString("MITA_ASIOITA_HALUAT_EDISTAA"));
				candidate.setOccupation(rs.getString("AMMATTI"));
				list.add(candidate);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Candidates getCandidateInfo(int id) {
		Candidates result = null;
		String sql = "select * from EHDOKKAAT where EHDOKAS_ID = ?";
		
		try {
			
			PreparedStatement stmt = conn.prepareStatement(sql);
						
			stmt.setInt(1, id);
			
			ResultSet resultset = stmt.executeQuery();
			
			if (resultset.next()) {
				result = new Candidates();
				result.setId(resultset.getInt("EHDOKAS_ID"));
				result.setName(resultset.getString("ETUNIMI"));
				result.setSurname(resultset.getString("SUKUNIMI"));
				result.setParty(resultset.getString("PUOLUE"));
				result.setHomecity(resultset.getString("KOTIPAIKKAKUNTA"));
				result.setIka(resultset.getInt("IKA"));
				result.setDescription(resultset.getString("MIKSI_EDUSKUNTAAN"));
				result.setIdea(resultset.getString("MITA_ASIOITA_HALUAT_EDISTAA"));
				result.setOccupation(resultset.getString("AMMATTI"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int updateCandidates(Candidates candidate) {
		int count = 0;
		String sql = "update EHDOKKAAT set ETUNIMI = ?, SUKUNIMI = ?, PUOLUE = ?, KOTIPAIKKAKUNTA = ?, IKA = ?, MIKSI_EDUSKUNTAAN = ?, MITA_ASIOITA_HALUAT_EDISTAA = ?, AMMATTI = ? where EHDOKAS_ID = ?";
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

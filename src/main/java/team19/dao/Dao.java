package team19.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import team19.adminfeatures.Candidates;
import team19.data.Answer;
import team19.data.Candidate;
import team19.data.QAnswer;
import team19.data.Question;


public class Dao {
	private Connection conn;
	private String url;
	private String user;
	private String pass;
	
	public Dao(String url, String user, String pass) {
		System.out.println("Dao(String url, String user, String pass) CONSTRUCTOR ******");
		this.url=url;
		this.user=user;
		this.pass=pass;
	}
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
	
	public void addCandidate (String surname, String firstname, String party, String location, int age, String reason, String goals, String profession) {
		
		String sql = "insert into candidates (SURNAME, FIRSTNAME, PARTY, LOCATION, AGE, REASON_FOR_RUNNING, AIMS_AND_GOALS, PROFESSION) values (?, ?, ?, ?, ?, ?, ?, ?)";
	
		try {
			
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, surname);
			stmt.setString(2, firstname);
			stmt.setString(3, party);
			stmt.setString(4, location);
			stmt.setInt(5, age);
			stmt.setString(6, reason);
			stmt.setString(7, goals);
			stmt.setString(8, profession);
			
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
	
	/**
	 * Method for reading all candidates from database
	 * @return
	 */
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
	
	/**
	 * Method to get information about candidate based on id
	 * @param id
	 * @return
	 */
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


	

	
	/**
	 * Get answers from candidate id ordered by question id
	 * @param CANDIDATE_ID
	 * @return
	 */
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
			return politician;
		}
		catch(SQLException e) {
			System.out.println("Operation error deleteAnswer()--" + url + "\nUser: " + user + " / " + pass);
			return null;
		}
	}
	/**
	 * Read all candidate in asc order
	 * @return
	 */
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
	/**
	 * Takes all answers from answers table 
	 * @return
	 */
	public ArrayList<QAnswer> readAllAnswers() {
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
	/**
	 * Takes all question from questions table 
	 * @return
	 */
	public ArrayList<Question> readAllQuestion() {
		System.out.println("readAllQuestion()");
		ArrayList<Question> list=new ArrayList<>();
		try {
			Statement stmt=conn.createStatement();
			ResultSet RS=stmt.executeQuery("select * from questions");
			System.out.println("RS: " + RS);
			while (RS.next()){
				Question q=new Question();
				q.setId(RS.getInt("QUESTION_ID"));
				q.setQuestion(RS.getString("QUESTION"));
				list.add(q);
			}
			return list;
		}
		catch(SQLException e) {
			return null;
		}
	}



	/**
	 * Takes the question by question id from questions table 
	 * @param id
	 * @return
	 */
	public Question readQuestion(String id) {
		Question f=null;
		try {
			String sql="select * from questions where id=?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet RS=pstmt.executeQuery();
			while (RS.next()){
				f=new Question();
				f.setId(RS.getInt("QUESTION_ID"));
				f.setQuestion(RS.getString("QUESTION"));
			}
			return f;
		}
		catch(SQLException e) {
			return null;
		}
	}

}

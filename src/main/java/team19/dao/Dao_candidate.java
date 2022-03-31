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
	
	public void insertCandidate(Candidate c) {
		try {
			String sql="insert into EHDOKKAAT (SUKUNIMI, ETUNIMI, PUOLUE, KOTIPAIKKAKUNTA, IKA, MIKSI_EDUSKUNTAAN, MITA_ASIOITA_HALUAT_EDISTAA, AMMATTI, USERNAME, PASSWORD) VALUES (?, ?, ?, ?, ?, ?, ?, ?, CONCAT(RTRIM((LTRIM(SUKUNIMI))), CONVERT(EHDOKAS_ID, CHAR)), '1a59ef90d1ea801448e1567d0896a99f');";
			PreparedStatement pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, c.getSName());
				pstmt.setString(2, c.getFName());
				pstmt.setString(3, c.getParty());
				pstmt.setString(4, c.getLocation());
				pstmt.setInt(5, c.getAge());
				pstmt.setString(6, c.getReason());
				pstmt.setString(7, c.getGoals());
				pstmt.setString(8, c.getProfession());
				pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateCandidate(Candidate c) {
		System.out.println("updateCandidate(Candidate q)");
		try {
			String sql="UPDATE CANDIDATES SET SUKUNIMI=?, ETUNIMI=?, PUOLUE=?, KOTIPAIKKAKUNTA=?, IKA=?, MIKSI_EDUSKUNTAAN=?, MITA_ASIOITA_HALUAT_EDISTAA=?, AMMATTI=? WHERE EHDOKAS_ID=?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, c.getSName());
			pstmt.setString(2, c.getFName());
			pstmt.setString(3, c.getParty());
			pstmt.setString(4, c.getLocation());
			pstmt.setInt(5, c.getAge());
			pstmt.setString(6, c.getReason());
			pstmt.setString(7, c.getGoals());
			pstmt.setString(8, c.getProfession());
			pstmt.setInt(9, c.getId());
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public void deleteCandidate(String id) {
		System.out.println("deleteCandidate(String id)");
		try {
			String sql="DELETE FROM EHDOKKAAT WHERE EHDOKAS_ID=?;";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Candidate> readAllCandidate() { // Will read all cans in asc order
		ArrayList<Candidate> list=new ArrayList<>();
		try {
			Statement stmt=conn.createStatement();
			ResultSet RS=stmt.executeQuery("select * from EHDOKKAAT");
			while (RS.next()){
				Candidate c=new Candidate();
				c.setId(RS.getInt("EHDOKAS_ID"));
				c.setSName(RS.getString("SUKUNIMI"));
				c.setFName(RS.getString("ETUNIMI"));
				c.setParty(RS.getString("PUOLUE"));
				c.setLocation(RS.getString("KOTIPAIKKAKUNTA"));
				c.setAge(RS.getInt("IKA"));
				c.setReason(RS.getString("MIKSI_EDUSKUNTAAN"));
				c.setGoals(RS.getString("MITA_ASIOITA_HALUAT_EDISTAA"));
				c.setProfession(RS.getString("AMMATTI"));
				list.add(c);
			}
			return list;
		}
		catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	public ArrayList<Candidate> readAllCandidateDesc() { // WIll read all cans in desc order
		ArrayList<Candidate> list=new ArrayList<>();
		try {
			Statement stmt=conn.createStatement();
			ResultSet RS=stmt.executeQuery("select * from EHDOKKAAT order by EHDOKAS_ID desc");
			while (RS.next()){
				Candidate c=new Candidate();
				c.setId(RS.getInt("EHDOKAS_ID"));
				c.setSName(RS.getString("SUKUNIMI"));
				c.setFName(RS.getString("ETUNIMI"));
				c.setParty(RS.getString("PUOLUE"));
				c.setLocation(RS.getString("KOTIPAIKKAKUNTA"));
				c.setAge(RS.getInt("IKA"));
				c.setReason(RS.getString("MIKSI_EDUSKUNTAAN"));
				c.setGoals(RS.getString("MITA_ASIOITA_HALUAT_EDISTAA"));
				c.setProfession(RS.getString("AMMATTI"));
				list.add(c);
			}
			return list;
		}
		catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	public ArrayList<Candidate> loginCandidate(String login_sql) {
		System.out.println("loginCandidate() is connected..");
		ArrayList<Candidate> list = new ArrayList<>();
		try {
			Statement stmt = conn.createStatement();
			ResultSet RS = stmt.executeQuery(login_sql);
			System.out.println("RS: " + RS);
			while (RS.next()){
				Candidate c=new Candidate();
				c.setId(RS.getInt("EHDOKAS_ID"));
				c.setUSERNAME(RS.getString("USERNAME"));
				c.setPASSWORD(RS.getString("PASSWORD"));
				list.add(c);
			}
			return list;
		}
		catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public Candidate readCandidate(String id) {
		Candidate f=null;
		try {
			String sql="select * from EHDOKKAAT where id=?";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet RS=pstmt.executeQuery();
			while (RS.next()){
				f=new Candidate();
				f.setId(RS.getInt("EHDOKAS_ID"));
				f.setParty(RS.getString("PUOLUE"));

			}
			return f;
		}
		catch(SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

}

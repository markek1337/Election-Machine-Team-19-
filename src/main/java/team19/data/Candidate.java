package team19.data;
/**
 * Simple class for creating strings and ints based on database info
 * @author slava
 * @version 1.0
 */
/**
 * @author slava
 *
 */
public class Candidate {
	
	/**
	 * int value for id
	 */
	private int id;
	/**
	 * String value for party
	 */
	private String party;
	/**
	 * String value for location
	 */
	private String location;
	/**
	 * int value for age
	 */
	private int age;
	/**
	 * String value for reason
	 */
	private String reason;
	/**
	 * String value for goals
	 */
	private String goals;
	/**
	 * String value for profession
	 */
	private String profession;
	/**
	 * String value for first name
	 */
	private String fName;
	/**
	 * String value for surname
	 */
	private String sName;
	/**
	 * String value for username
	 */
	private String USERNAME;
	/**
	 * String value for password
	 */
	private String PASSWORD;
	
	
	/**
	 * Constructor with parameters
	 * Method used to eliminate the confusion between class attributes and parameters with the same name
	 * @param id
	 * @param sName
	 * @param fName
	 * @param party
	 * @param location
	 * @param age
	 * @param reason
	 * @param goals
	 * @param profession
	 * @param USERNAME
	 * @param PASSWORD
	 */
	public Candidate(String id, String sName, String fName, String party, String location, String age, String reason, 
			String goals, String profession, String USERNAME, String PASSWORD) {
		setId(id);
		this.sName=sName;
		this.fName=fName;
		this.party=party;
		this.location=location;
		setAge(age);
		this.reason=reason;
		this.goals=goals;
		this.profession=profession;
		this.USERNAME=USERNAME;
		this.PASSWORD=PASSWORD;	
	}
	
	/**
	 * Constructor with parameters
	 * Method used to eliminate the confusion between class attributes and parameters with the same name
	 * @param id
	 * @param sName
	 * @param fName
	 * @param party
	 * @param location
	 * @param age
	 * @param reason
	 * @param goals
	 * @param profession
	 * @param USERNAME
	 * @param PASSWORD
	 */
	public Candidate(int id, String sName, String fName, String party, String location, int age, String reason, 
			String goals, String profession, String USERNAME, String PASSWORD) {
		setId(id);
		this.sName=sName;
		this.fName=fName;
		this.party=party;
		this.location=location;
		setAge(age);
		this.reason=reason;
		this.goals=goals;
		this.profession=profession;
		this.USERNAME=USERNAME;
		this.PASSWORD=PASSWORD;	
	}
	
	/**
	 * Method to check if everything is working fine
	 */
	public Candidate() {
		System.out.println("Candidate() default constructor");		
	}
	
	
	// set
	
	/**
	 * The set method takes a parameter (id) and assigns it to the id variable.
	 * @param id
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * The set method takes a parameter (id) and assigns it to the id variable.
	 * @param id
	 */
	public void setId(String id) {
		try {
			this.id = Integer.parseInt(id);
		}
		catch(NumberFormatException | NullPointerException e) {
		}
	}
	/**
	 * The set method takes a parameter (candidate) and assigns it to the candidate variable.
	 * @param candidate
	 */
	public void setParty(String candidate) {
		this.party = candidate;	
	}
	/**
	 * The set method takes a parameter (sname) and assigns it to the sname variable.
	 * @param sName
	 */
	public void setSName(String sName) { //propeety name in JSP (JSTL lib) will be c.SName
		this.sName = sName;	
	}
	/**
	 * The set method takes a parameter (fname) and assigns it to the fname variable.
	 * @param fName
	 */
	public void setFName(String fName) { //propeety name in JSP (JSTL lib) will be c.FName
		this.fName = fName;	
	}
	/**
	 * The set method takes a parameter (location) and assigns it to the location variable.
	 * @param location
	 */
	public void setLocation(String location) {
		this.location = location;	
	}
	/**
	 * The set method takes a parameter (age) and assigns it to the age variable.
	 * @param age
	 */
	public void setAge(int age) {
		this.age = age;	
	}
	/**
	 * The set method takes a parameter (age) and assigns it to the age variable.
	 * @param age
	 */
	public void setAge(String age) {
		try {
			this.age = Integer.parseInt(age);
		}
		catch(NumberFormatException | NullPointerException e) {
		}	
	}
	/**
	 * The set method takes a parameter (reason) and assigns it to the reason variable.
	 * @param reason
	 */
	public void setReason(String reason) {
		this.reason = reason;		
	}
	/**
	 * The set method takes a parameter (goals) and assigns it to the goals variable.
	 * @param goals
	 */
	public void setGoals(String goals) {
		this.goals = goals;
	}
	/**
	 * The set method takes a parameter (profession) and assigns it to the profession variable.
	 * @param profession
	 */
	public void setProfession(String profession) {
		this.profession = profession;		
	}
	/**
	 * The set method takes a parameter (USERNAME) and assigns it to the USERNAME variable.
	 * @param USERNAME
	 */
	public void setUSERNAME(String USERNAME) {
		this.USERNAME = USERNAME;		
	}
	/**
	 * The set method takes a parameter (PASSWORD) and assigns it to the PASSWORD variable.
	 * @param PASSWORD
	 */
	public void setPASSWORD(String PASSWORD) {
		this.PASSWORD = PASSWORD;		
	}
	//Get
	/**
	 * The get method returns the value of the variable id.
	 * @return
	 */
	public int getId() {
		return id;
	}
	/**
	 * The get method returns the value of the variable party.
	 * @return
	 */
	public String getParty() {
		return party;
	}
	/**
	 * The get method returns the value of the variable sname.
	 * @return
	 */
	public String getSName() {
		return sName;
	}
	/**
	 * The get method returns the value of the variable fname.
	 * @return
	 */
	public String getFName() {
		return fName;
	}
	/**
	 * The get method returns the value of the variable location.
	 * @return
	 */
	public String getLocation() {
		return location;		
	}
	/**
	 * The get method returns the value of the variable age.
	 * @return
	 */
	public int getAge() {
		return age;	
	}
	/**
	 * The get method returns the value of the variable reason.
	 * @return
	 */
	public String getReason() {
		return reason;	
	}
	/**
	 * The get method returns the value of the variable goals.
	 * @return
	 */
	public String getGoals() {
		return goals;
	}
	/**
	 * The get method returns the value of the variable profession.
	 * @return
	 */
	public String getProfession() {
		return profession;
	}	
	/**
	 * The get method returns the value of the variable USERNAME.
	 * @return
	 */
	public String getUSERNAME() {
		return USERNAME;		
	}
	/**
	 * The get method returns the value of the variable PASSWORD.
	 * @return
	 */
	public String getPASSWORD() {
		return PASSWORD;		
	}
}


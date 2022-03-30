package team19.adminfeatures;

import java.io.Serializable;

public class Candidates implements Serializable {
	
	private int id;
	private String surname;
	private String name;
	private String party;
	private String homecity;
	private int ika;
	private String description;
	private String idea;
	private String occupation;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getParty() {
		return party;
	}
	public void setParty(String party) {
		this.party = party;
	}
	public String getHomecity() {
		return homecity;
	}
	public void setHomecity(String homecity) {
		this.homecity = homecity;
	}
	public int getIka() {
		return ika;
	}
	public void setIka(int ika) {
		this.ika = ika;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getIdea() {
		return idea;
	}
	public void setIdea(String idea) {
		this.idea = idea;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	
	public String toString () {
		return id + " " + name + " " + surname;
	}
}

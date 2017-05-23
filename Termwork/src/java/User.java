package java;

public class User {
	private String username;
	private String email;
	private String usersex;
	private String password;
	private int eassynum;
	private String resume;
	private String headres;
	
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	public String getHeadres() {
		return headres;
	}
	public void setHeadres(String headres) {
		this.headres = headres;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getEassynum() {
		return eassynum;
	}
	public void setEassynum(int eassynum) {
		this.eassynum = eassynum;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	private String tag;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsersex() {
		return usersex;
	}
	public void setUsersex(String usersex) {
		this.usersex = usersex;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}

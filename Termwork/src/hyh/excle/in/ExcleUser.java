package hyh.excle.in;

public class ExcleUser {
	private String headres;
	private String usersex;
	private String resume;
	private String username;
	private String email;
	private String tag;
	private int eassynum;
	private String power;
	private String password;
	//headres usersex resume username email tag eassynum power password
	public void init1(){
		headres=null;
		usersex=null;
		resume=null;
		username=null;
		email=null;
		tag=null;
		eassynum=0;
		power=null;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getHeadres() {
		return headres;
	}
	public void setHeadres(String headres) {
		this.headres = headres;
	}
	public String getUsersex() {
		return usersex;
	}
	public void setUsersex(String usersex) {
		this.usersex = usersex;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getEassynum() {
		return eassynum;
	}
	public void setEassynum(int eassynum) {
		this.eassynum = eassynum;
	}
	public String getPower() {
		return power;
	}
	public void setPower(String power) {
		this.power = power;
	}

}

package sr.api.persistence.domain;

import org.springframework.data.mongodb.core.mapping.Document;


/**
 * @author sercan
 *
 */

@Document(collection="user")
public class User extends Base{
	private String name;
	private String userName;
	private String pass;
	private int role;
	
	public User(){
		super();
	}
	
	

	public User(String name, String userName, String pass, int role) {
		super();
		this.name = name;
		this.userName = userName;
		this.pass = pass;
		this.role = role;
	}



	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}
	
	
}

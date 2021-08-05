package project;

public class User{
	String Username;
	String Email;
	String Code;
	
	public User() {
		
	}
	public User(String Email, String Code) {
		this.Email = Email;
		this.Code =Code;
	}
	
	public User(String Username, String Email, String Code) {
		this.Username =Username;
		this.Email = Email;
		this.Code =Code;
		
	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getCode() {
		return Code;
	}

	public void setCode(String code) {
		this.Code = code;
	}
}

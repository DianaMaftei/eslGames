package ro.jademy.domain.entity;

/**
*
*@author diana.maftei[at]gmail.com
*/
public class User {
	String fullName;
	String password;
	String username;
	String email;
	TypeOfUser typeOfUser;


	public User() {
	}

	public User(String fullName,String username, String email, String password, TypeOfUser typeOfUser) {
		this.fullName = fullName;
		this.username = username;
		this.email = email;
		this.password = password;
		this.typeOfUser = typeOfUser;
	}

	public String getPassword() {
		return password;
	}

	public String getFullName() {
		return fullName;
	}

	public String getUsername() {
		return username;
	}

	public String getEmail() {
		return email;
	}
	
	public TypeOfUser getTypeOfUser() {
		return typeOfUser;
	}

	public void setTypeOfUser(TypeOfUser typeOfUser) {
		this.typeOfUser = typeOfUser;
	}



	@Override
	public String toString() {
		return "User [fullName=" + fullName + ", username=" + username + ", email=" + email
				+ ", password=" + password + ", typeOfUser=" + typeOfUser + "]";
	}

	
}

package ro.jademy.domain.entity;
/**
*
*@author diana.maftei[at]gmail.com
*/
public enum RegisterMessages {
	
	INVALID_PASSWORD("Password must contain at least one lowercase letter, uppercase letter, special character and digit, and it must be at least 8 characters long."),
	TAKEN_USERNAME("Username already in use."),
	INVALID_EMAIL("Please enter a valid email address."),
	INVALID_FULLNAME("Please enter your full name."),
	INVALID_USERNAME("Please enter a valid username."),
	SUCCESS("Success");

	private RegisterMessages(String message){
		this.message = message;
	}
	
	private String message;
	
	public String getMessage() {
		return message;
	}

}

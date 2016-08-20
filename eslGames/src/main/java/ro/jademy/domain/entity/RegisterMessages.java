package ro.jademy.domain.entity;
/**
*
*@author diana.maftei[at]gmail.com
*/
public enum RegisterMessages {
	
	INVALID_PASSWORD("Enter a combination of at least six letters, numbers and punctuation marks."),
	CONFIRM_PASSWORD("Passwords do not match."),
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

package ro.jademy.domain.entity;

/**
 *
 * @author diana.maftei[at]gmail.com
 */
public enum LoginMessages {

	INVALID_USERNAME("The username does not exist."), 
	INCORRECT_PASSWORD("Incorrect password."), 
	SUCCESS("Success.");

	private LoginMessages(String message) {
		this.message = message;
	}

	private String message;

	public String getMessage() {
		return message;
	}

}

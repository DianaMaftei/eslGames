package ro.jademy.domain.entity;

/**
 *
 * @author diana.maftei[at]gmail.com
 */
public enum LoginMessages {

	INVALID_USERNAME("The username does not exist."), INCORRECT_PASSWORD("Incorrect password."), SUCCESS("Success."), DATABASE_ERROR("Could not access the database.");

	private LoginMessages(String message) {
		this.message = message;
	}

	private String message;

	public String getMessage() {
		return message;
	}

}

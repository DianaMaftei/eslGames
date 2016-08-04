package ro.jademy.domain.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import ro.jademy.domain.entity.RegisterMessages;
import ro.jademy.domain.entity.TypeOfUser;
import ro.jademy.domain.entity.User;
import ro.jademy.persistence.UserDAO;

/**
 *
 * @author diana.maftei[at]gmail.com
 */
public class RegisterService {
	private Pattern pr;
	private Matcher m;

	TransactionManager tm = new TransactionManager();

	public RegisterMessages registerUser(String fullName, String username, String password1, String password2, String email,
			TypeOfUser userType) {
		try {
			tm.beginTransaction();
			if(!isFullNameValid(fullName)){
				return RegisterMessages.INVALID_FULLNAME;
			}
			if(doesUserExist(username)){
				return RegisterMessages.TAKEN_USERNAME;
			}
			if(!isUsernameValid(username)){
				return RegisterMessages.INVALID_USERNAME;
			}
			if(!isEmailValid(email)){
				return RegisterMessages.INVALID_EMAIL;
			}
			if(!isPasswordValid(password1)){
				return RegisterMessages.INVALID_PASSWORD;
			}
			if(!doPasswordsMatch(password1, password2)){
				return RegisterMessages.CONFIRM_PASSWORD;
			}
			
			new UserDAO().updateDatabaseWithNewUser(fullName, username, password1, email, userType);
			
			tm.commit();
			
			return RegisterMessages.SUCCESS;

		} catch (Exception e) {
			tm.rollback();
			return RegisterMessages.DATABASE_ERROR;
		}
	}

	private boolean doesUserExist(String username) {
		User user = new UserDAO().getUserByUsername(username);
		if (user == null) {
			return false;
		}
		return true;
	}

	private boolean isFullNameValid(String name) {
		String pattern = "[A-z ,.'-]+";
		pr = Pattern.compile(pattern);
		m = pr.matcher(name);
		if (m.matches()) {
			return true;
		} else {
			return false;
		}
	}

	private boolean isUsernameValid(String username) {
		// with RegEx
		String pattern = "\\w+";
		pr = Pattern.compile(pattern);
		m = pr.matcher(username);
		if (m.matches()) {
			return true;
		} else {
			return false;
		}
	}

	private boolean isPasswordValid(String password) {
		// with RegEx
		String pattern = "^(?=\\w*\\d)(?=\\w*[a-z])(?=\\w*[A-Z])\\w{6,14}$";
		pr = Pattern.compile(pattern);
		m = pr.matcher(password);
		if (m.matches()) {
			return true;
		} else {
			return false;
		}
	}

	private boolean isEmailValid(String email) {
		String pattern = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
		pr = Pattern.compile(pattern);
		m = pr.matcher(email);
		if (m.matches()) {
			return true;
		} else {
			return false;
		}
	}

	private boolean doPasswordsMatch(String pass1, String pass2) {
		if (pass1 == null || pass2 == null) {
			return false;
		} else if (pass1.equals(pass2)) {
			return true;
		} else {
			return false;
		}
	}

}

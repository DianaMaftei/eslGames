package ro.jademy.domain.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ro.jademy.domain.entity.RegisterMessages;
import ro.jademy.domain.entity.SiteUser;
import ro.jademy.domain.entity.TypeOfUser;
import ro.jademy.persistence.UserDAO;

/**
 *
 * @author diana.maftei[at]gmail.com
 */
@Service
public class RegisterService {
	private Pattern pr;
	private Matcher m;
	@Autowired
	private UserDAO userDAO;

	public RegisterMessages registerUser(String fullName, String username, String password, String email, TypeOfUser userType) {
		if (!isFullNameValid(fullName)) {
			return RegisterMessages.INVALID_FULLNAME;
		}
		if (doesUserExist(username)) {
			return RegisterMessages.TAKEN_USERNAME;
		}
		if (!isUsernameValid(username)) {
			return RegisterMessages.INVALID_USERNAME;
		}
		if (!isEmailValid(email)) {
			return RegisterMessages.INVALID_EMAIL;
		}
		if (!isPasswordValid(password)) {
			return RegisterMessages.INVALID_PASSWORD;
		}

		userDAO.updateDatabaseWithNewUser(fullName, username, password, email, userType);

		return RegisterMessages.SUCCESS;
	}

	private boolean doesUserExist(String username) {
		SiteUser user = userDAO.getUserByUsername(username);
		if (user == null) {
			return false;
		}
		return true;
	}

	private boolean isFullNameValid(String name) {
		// with RegEx
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
		// with RegEx
		String pattern = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
		pr = Pattern.compile(pattern);
		m = pr.matcher(email);
		if (m.matches()) {
			return true;
		} else {
			return false;
		}
	}

}

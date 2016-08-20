package ro.jademy.domain.service;

import org.springframework.beans.factory.annotation.Autowired;

import ro.jademy.domain.entity.LoginMessages;
import ro.jademy.domain.entity.SiteUser;
import ro.jademy.persistence.UserDAO;

/**
 *
 * @author diana.maftei[at]gmail.com
 */
public class LoginService {
	@Autowired
	private UserDAO userDAO;


	public LoginMessages doLogin(String username, String password) {

			SiteUser user = userDAO.getUserByUsername(username);

			if (user == null) {
				return LoginMessages.INVALID_USERNAME;
			}
			if (!password.equals(user.getPassword())) {
				return LoginMessages.INCORRECT_PASSWORD;
			}
			return LoginMessages.SUCCESS;

	}

	public SiteUser getUser(String username) {
		return userDAO.getUserByUsername(username);
	}
}

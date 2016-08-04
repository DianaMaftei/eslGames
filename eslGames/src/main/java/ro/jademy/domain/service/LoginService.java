package ro.jademy.domain.service;

import ro.jademy.domain.entity.LoginMessages;
import ro.jademy.domain.entity.User;
import ro.jademy.persistence.UserDAO;

/**
 *
 * @author diana.maftei[at]gmail.com
 */
public class LoginService {

	TransactionManager tm = new TransactionManager();

	public LoginMessages doLogin(String username, String password) {

		try {
			tm.beginTransaction();

			User user = new UserDAO().getUserByUsername(username);

			if (user == null) {
				return LoginMessages.INVALID_USERNAME;
			}
			if (!password.equals(user.getPassword())) {
				return LoginMessages.INCORRECT_PASSWORD;
			}
			tm.commit();
			return LoginMessages.SUCCESS;

		} catch (Exception e) {
			tm.rollback();
			return LoginMessages.DATABASE_ERROR;
		}
	}

	public User getUser(String username) {
		User user;
		try {
			tm.beginTransaction();
			user = new UserDAO().getUserByUsername(username);
			tm.commit();
		} catch (Exception e) {
			tm.rollback();
			return null;
		}
		return user;
	}
}

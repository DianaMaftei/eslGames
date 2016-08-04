package ro.jademy.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ro.jademy.domain.entity.TypeOfUser;
import ro.jademy.domain.entity.User;
import ro.jademy.domain.service.TransactionManager;



/**
 *
 * @author diana.maftei[at]gmail.com
 */
public class UserDAO {

	public User getUserByUsername(String name) {
		
		String username = null;
		String password = null;
		String fullName = null;
		String email = null;
		TypeOfUser userType = null;

		Connection connection = new TransactionManager().getConnection();

		String sql = "select * from site_users where username = ?";

		PreparedStatement statement;
		try {
			statement = connection.prepareStatement(sql);
			statement.setString(1, name);
			ResultSet rs = statement.executeQuery();
			while (rs.next()) {
				fullName = rs.getString("full_name");
				username = rs.getString("username");
				password = rs.getString("password");
				email = rs.getString("email");
				userType = TypeOfUser.valueOf(rs.getString("user_type"));
			}
		} catch (SQLException e) {
			throw new RuntimeException("Cannot execute query.", e);
		}

		if (username == null) {
			return null;
		} else {
			User user = new User(fullName, username, email, password, userType);
			return user;
		}

	}

	public int updateDatabaseWithNewUser(String fullName, String username, String password, String email,
			TypeOfUser type) {

		int updated = 0;
		Connection connection = new TransactionManager().getConnection();
		
		String sql = "insert into site_users values (null, '?', '?', '?', '?', '?')";
		
		PreparedStatement statement;
		
		try {
			statement = connection.prepareStatement(sql);
			statement.setString(1, fullName);
			statement.setString(2, username);
			statement.setString(3, password);
			statement.setString(4, email);
			statement.setString(5, type.toString());

			updated = statement.executeUpdate();
			return updated;
			
		} catch (SQLException e) {
			throw new RuntimeException("Cannot execute query.", e);
		}

	}

}

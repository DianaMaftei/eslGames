package ro.jademy.domain.service;

/**
*
*@author diana.maftei[at]gmail.com
*/
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class TransactionManager {

	private static ThreadLocal<Connection> threadL = new ThreadLocal<>();

	public void beginTransaction() {

		try {		
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/eslGamesDB");
			Connection connection = ds.getConnection();
			connection.setAutoCommit(false);
			threadL.set(connection);
		} catch (SQLException | NamingException e) {
			throw new RuntimeException("Cannot connect to database.", e);
		}
	}

	public void commit() {
		try {
			threadL.get().commit();
			threadL.get().close();
			threadL.remove();
		} catch (SQLException e) {
			throw new RuntimeException("Cannot commit to database.", e);
		}
	}

	public void rollback() {
		try {
			threadL.get().rollback();
			threadL.get().close();
			threadL.remove();
		} catch (SQLException e) {
			throw new RuntimeException("Cannot rollback database.", e);
		}
	}

	public Connection getConnection() {
		return threadL.get();
	}
}

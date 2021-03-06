package ro.jademy.persistence;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import ro.jademy.domain.entity.SiteUser;
import ro.jademy.domain.entity.TypeOfUser;
import ro.jademy.util.HibernateUtil;

/**
 *
 * @author diana.maftei[at]gmail.com
 */
@Repository
public class UserDAO {

	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	public SiteUser getUserByUsername(String username) {

		Transaction transaction = null;
		List<SiteUser> results;

		try (Session session = sessionFactory.openSession()) {
			transaction = session.beginTransaction();
			Query hqlQuery = session.createQuery("from SiteUser as siteUser where siteUser.username = :username");
			results = hqlQuery.setString("username", username).list();
			transaction.commit();

		} catch (Exception e) {
			transaction.rollback();
			throw new RuntimeException("Cannot commit transaction.", e);
		}
		if(results.size() == 0){
			return null;
		}
		return results.get(0);
	}

	public void updateDatabaseWithNewUser(String fullName, String username, String password, String email,
			TypeOfUser type) {

		Transaction transaction = null;

		try (Session session = sessionFactory.openSession()) {
			transaction = session.beginTransaction();

			SiteUser user = new SiteUser();
			user.setFullName(fullName);
			user.setUsername(username);
			user.setEmail(email);
			user.setPassword(password);
			user.setTypeOfUser(type);

			session.save(user);

			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			throw new RuntimeException("Cannot commit transaction.", e);
		}

	}

}

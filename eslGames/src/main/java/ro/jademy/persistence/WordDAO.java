package ro.jademy.persistence;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import ro.jademy.domain.entity.Level;
import ro.jademy.domain.entity.Theme;
import ro.jademy.domain.entity.Word;
import ro.jademy.util.HibernateUtil;

/**
 *
 * @author diana.maftei[at]gmail.com
 */
@Repository
public class WordDAO {

	public List<Word> getRandomWords(int numberOfWords, Level level, Theme theme) {
		Transaction transaction = null;
		List<Word> results;
		try (SessionFactory sessionFactory = HibernateUtil.getSessionFactory();Session session = sessionFactory.openSession()) {
			transaction = session.beginTransaction();
			Criteria cr = session.createCriteria(Word.class);
			cr.setMaxResults(numberOfWords);

			if (level != null) {
				cr.add(Restrictions.eq("level", level));
			}
			if (theme != null) {
				cr.add(Restrictions.eq("theme", theme));
			}

			cr.add(Restrictions.sqlRestriction("1=1 order by random()"));
			cr.setProjection(Projections.property("word"));

			results = cr.list();
			transaction.commit();

		} catch (Exception e) {
			transaction.rollback();
			throw new RuntimeException("Cannot commit transaction.", e);
		}

		return results;
	}

}

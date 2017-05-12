package au.com.phytoline.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import au.com.phytoline.dao.ChemicalDAO;
import au.com.phytoline.entity.Chemical;

public class ChemicalDAOImpl implements ChemicalDAO {
	SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List getAllChemicalByPage(int page, int pageSize) {
		Session session = sessionFactory.getCurrentSession();

		Criteria c = session.createCriteria(Chemical.class);
		c.setFirstResult(pageSize * (page - 1));
		c.setMaxResults(pageSize);
		c.addOrder(Order.desc("cid"));
		return c.list();
	}

	@Override
	public Integer getCountOfChemical() {
		Session session = sessionFactory.getCurrentSession();
		Criteria c = session.createCriteria(Chemical.class);
		return c.list().size();
	}

	@Override
	public List getChemicalByConditionAndPage(String condition, int page,
			int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		Criteria c = session.createCriteria(Chemical.class);
		if (condition != null && !(condition.equals(""))) {
			c.add(Restrictions.like("cname", condition, MatchMode.ANYWHERE));
		}
		c.setFirstResult(pageSize * (page - 1));
		c.setMaxResults(pageSize);
		c.addOrder(Order.desc("cid"));
		return c.list();
	}

	@Override
	public Integer getCountOfChemicalByConditionAndPage(String condition) {
		Session session = sessionFactory.getCurrentSession();
		Criteria c = session.createCriteria(Chemical.class);
		if (condition != null && !("".equals(condition))) {
			c.add(Restrictions.like("cname", condition, MatchMode.ANYWHERE));
		}
		return c.list().size();
	}

	@Override
	public void addChemial(Chemical chemical) {
		Session session = sessionFactory.getCurrentSession();
		session.save(chemical);
	}

	@Override
	public Chemical getChemicalById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Chemical chemical = (Chemical) session.get(Chemical.class, id);
		return chemical;
	}

	@Override
	public void updateChemial(Chemical chemical) {
		Session session = sessionFactory.getCurrentSession();
		session.update(chemical);
	}

	@Override
	public void deleteChemial(Chemical chemical) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(chemical);
	}
}

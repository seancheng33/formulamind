package au.com.phytoline.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import au.com.phytoline.dao.UserDAO;
import au.com.phytoline.entity.User;

public class UserDAOImpl implements UserDAO {
	SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List login(User condition) {
		List list = null;
		Session session = sessionFactory.getCurrentSession();
		Criteria c = session.createCriteria(User.class);
		Example ex = Example.create(condition);
		c.add(ex);
		list = c.list();
		return list;
	}

}

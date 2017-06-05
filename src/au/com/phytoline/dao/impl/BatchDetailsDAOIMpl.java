package au.com.phytoline.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import au.com.phytoline.dao.BatchDetailsDAO;
import au.com.phytoline.entity.BatchDetails;

public class BatchDetailsDAOIMpl implements BatchDetailsDAO {
	SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addBatchDetails(BatchDetails batchDetails) {
		Session session = sessionFactory.getCurrentSession();
		session.save(batchDetails);
	}

}

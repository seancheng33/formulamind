package au.com.phytoline.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

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

	@Override
	public List getBatchDetailsByBatchNo(String BatchNo) {
		Session session = sessionFactory.getCurrentSession();
		Criteria c = session.createCriteria(BatchDetails.class);
		c.add(Restrictions.eq("bcode", BatchNo));
		return c.list();
	}

}

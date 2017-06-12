package au.com.phytoline.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;

import au.com.phytoline.dao.BatchDAO;
import au.com.phytoline.entity.Batch;

public class BatchDAOImpl implements BatchDAO {
	SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addBatch(Batch batch) {
		Session session = sessionFactory.getCurrentSession();
		session.save(batch);

	}

	@Override
	public List getAllBatchByPager(int page, int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		Criteria c=session.createCriteria(Batch.class);
		c.setFirstResult(pageSize*(page-1));
		c.setMaxResults(pageSize);
		c.addOrder(Order.desc("bid"));
		return c.list();
	}

	@Override
	public Integer getCountOfBatch() {
		Session session = sessionFactory.getCurrentSession();
		Criteria c=session.createCriteria(Batch.class);
		return c.list().size();
	}

	@Override
	public Integer getLastBatchSerials() {
		Integer count=null;
		try{
		Session session=sessionFactory.getCurrentSession();
		String hql="select max(batchSerials) from Batch";
		Query query=session.createQuery(hql);
		if(query.uniqueResult()!=null){
		count= Integer.parseInt(query.uniqueResult().toString()) ;
		}else{
			count=0;
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}

}

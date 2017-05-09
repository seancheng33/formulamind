package au.com.phytoline.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import au.com.phytoline.dao.SupplierDAO;
import au.com.phytoline.entity.Supplier;

public class SupplierDAOImpl implements SupplierDAO {
	SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List getAllSupplierByPage(int page, int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		Criteria c = session.createCriteria(Supplier.class);
		c.setFirstResult(pageSize * (page - 1));
		c.setMaxResults(pageSize);
		c.addOrder(Order.desc("sid"));
		return c.list();
	}

	@Override
	public Integer getCountOfSupplier() {
		Session session = sessionFactory.getCurrentSession();
		Criteria c = session.createCriteria(Supplier.class);
		return c.list().size();
	}

	@Override
	public void addSupplier(Supplier supplier) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(supplier);
	}

	@Override
	public Supplier getSupplierById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Supplier supplier = (Supplier) session.get(Supplier.class, id);
		return supplier;
	}

	@Override
	public void updateSupplier(Supplier supplier) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(supplier);
	}

	@Override
	public List getAllSupplier() {
		Session session = sessionFactory.getCurrentSession();
		Criteria c = session.createCriteria(Supplier.class);
		return c.list();
	}

	@Override
	public void deleteSupplier(Supplier supplier) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(supplier);
	}

	@Override
	public List getSupplierByConditionAndPage(String condition, int page,
			int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		Criteria c = session.createCriteria(Supplier.class);

		if (condition != null && !("".equals(condition))) {
			c.add(Restrictions.like("sname", condition, MatchMode.ANYWHERE));
		}
		c.setFirstResult(pageSize * (page - 1));
		c.setMaxResults(pageSize);
		c.addOrder(Order.desc("sid"));
		return c.list();
	}

	@Override
	public Integer getCountOfSupplierByConditionAndPage(String condition) {
		Session session = sessionFactory.getCurrentSession();
		Criteria c = session.createCriteria(Supplier.class);

		if (condition != null && !("".equals(condition))) {
			c.add(Restrictions.like("sname", condition, MatchMode.ANYWHERE));
		}

		return c.list().size();
	}

}

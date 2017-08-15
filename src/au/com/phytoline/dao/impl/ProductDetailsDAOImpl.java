package au.com.phytoline.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import au.com.phytoline.dao.ProductDetailsDAO;
import au.com.phytoline.entity.ProductDetails;

public class ProductDetailsDAOImpl implements ProductDetailsDAO {
	SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List getDetailsByProductId(int pid) {
		Session session = sessionFactory.getCurrentSession();
		Criteria c = session.createCriteria(ProductDetails.class);
		c.add(Restrictions.eq("pId", pid));
		return c.list();
	}

	@Override
	public void saveProductDetails(ProductDetails productDetails) {
		Session session = sessionFactory.getCurrentSession();
		session.save(productDetails);
	}

	@Override
	public void deleteProductDetails(ProductDetails productDetails) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(productDetails);
	}

}

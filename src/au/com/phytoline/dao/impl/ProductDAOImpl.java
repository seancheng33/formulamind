package au.com.phytoline.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;

import au.com.phytoline.dao.ProductDAO;
import au.com.phytoline.entity.Product;

public class ProductDAOImpl implements ProductDAO {
	SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List getAllProductBypage(int page, int pageSize) {
		Session session = sessionFactory.getCurrentSession();
		Criteria c = session.createCriteria(Product.class);
		
		c.setFirstResult(pageSize * (page - 1));
		c.setMaxResults(pageSize);
		c.addOrder(Order.desc("pid"));
		return c.list();
	}

	@Override
	public Integer getCountOfProduct() {
		Session session = sessionFactory.getCurrentSession();
		Criteria c = session.createCriteria(Product.class);
		return c.list().size();
	}

	@Override
	public Product findProductById(int id) {
		Session session = sessionFactory.getCurrentSession();
		Product product=(Product) session.get(Product.class, id);
		return product;
	}

	@Override
	public List getAllProduct() {
		Session session = sessionFactory.getCurrentSession();
		Criteria c = session.createCriteria(Product.class);
		return c.list();
	}

}

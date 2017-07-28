package au.com.phytoline.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

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

	@Override
	public void saveProduct(Product product) {
		Session session = sessionFactory.getCurrentSession();
		session.save(product);
		
	}

	@Override
	public Integer getProductIdByNameAndCode(String name, String code) {
		List list = null;
		Session session = sessionFactory.getCurrentSession();
		Criteria c = session.createCriteria(Product.class);
//		Product product =new Product();
//		product.setPname(name);
//		product.setPcode(code);
//		Example example = Example.create(product);
//		c.add(example);
		
		c.add(Restrictions.eq("pname", name));
		c.add(Restrictions.eq("pcode", code));
		
		list = c.list();
		Product product2 = (Product) list.get(0);
		int id = product2.getPid();
		return id;
	}
 
}

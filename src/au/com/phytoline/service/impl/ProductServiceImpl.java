package au.com.phytoline.service.impl;

import java.util.List;

import au.com.phytoline.dao.ProductDAO;
import au.com.phytoline.entity.Pager;
import au.com.phytoline.entity.Product;
import au.com.phytoline.service.ProductService;

public class ProductServiceImpl implements ProductService {
	ProductDAO productDAO;
	
	public void setProductDAO(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}

	@Override
	public List getAllProductBypage(int page, int pageSize) {
		return productDAO.getAllProductBypage(page, pageSize);
	}

	@Override
	public Pager getCountOfProduct(int pageSize) {
		int count = productDAO.getCountOfProduct();
		Pager pager = new Pager();
		pager.setPerPageRows(pageSize);
		pager.setRowCount(count);
		return pager;
	}

	@Override
	public Product findProductById(int id) {
		return productDAO.findProductById(id);
	}

	@Override
	public List getAllProduct() {
		return productDAO.getAllProduct();
	}

}

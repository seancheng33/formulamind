package au.com.phytoline.service.impl;

import java.util.List;

import au.com.phytoline.dao.ProductDetailsDAO;
import au.com.phytoline.service.ProductDetailsService;

public class ProductDetailsServiceImpl implements ProductDetailsService {
	ProductDetailsDAO productDetailsDAO;
public void setProductDetailsDAO(ProductDetailsDAO productDetailsDAO) {
	this.productDetailsDAO = productDetailsDAO;
}
	@Override
	public List getDetailsByProductId(int pid) {

		return productDetailsDAO.getDetailsByProductId(pid);
	}

}

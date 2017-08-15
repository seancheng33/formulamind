package au.com.phytoline.dao;

import java.util.List;

import au.com.phytoline.entity.ProductDetails;

public interface ProductDetailsDAO {
	public List getDetailsByProductId(int pid);
	public void saveProductDetails(ProductDetails productDetails);
}

package au.com.phytoline.service;

import java.util.List;

import au.com.phytoline.entity.ProductDetails;

public interface ProductDetailsService {
	public List getDetailsByProductId(int pid);
	public void saveProductDetails(ProductDetails productDetails);
	public void deleteProductDetails(ProductDetails productDetails);
}

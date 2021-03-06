package au.com.phytoline.service;

import java.util.List;

import au.com.phytoline.entity.Pager;
import au.com.phytoline.entity.Product;

public interface ProductService {
	
	public List getAllProductBypage(int page,int pageSize);
	
	public Pager getCountOfProduct(int pageSize);
	
	public Product findProductById(int id);
	
	public List getAllProduct();
	
	public void saveProduct(Product product);
	
	public Integer getProductIdByNameAndCode(String name,String code);
	
	public void deleteProduct(Product product);
}

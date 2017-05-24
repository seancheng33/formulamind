package au.com.phytoline.dao;

import java.util.List;

import au.com.phytoline.entity.Product;

public interface ProductDAO {
	public List getAllProductBypage(int page,int pageSize);
	public Integer getCountOfProduct();
	public Product findProductById(int id);
	public List getAllProduct();
}

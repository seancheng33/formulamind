package au.com.phytoline.service;

import java.util.List;

import au.com.phytoline.entity.Pager;

public interface ProductService {
	public List getAllProductBypage(int page,int pageSize);
	public Pager getCountOfProduct(int pageSize);
}

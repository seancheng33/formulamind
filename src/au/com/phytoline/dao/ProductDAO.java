package au.com.phytoline.dao;

import java.util.List;

public interface ProductDAO {
	public List getAllProductBypage(int page,int pageSize);
	public Integer getCountOfProduct();
}

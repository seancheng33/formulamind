package au.com.phytoline.dao;

import java.util.List;

import au.com.phytoline.entity.Supplier;

public interface SupplierDAO {
	//获取所有supplier，指定页码和显示数
	public List getAllSupplierByPage(int page,int pageSize);
	//获取所有supplier的数量
	public Integer getCountOfSupplier();
	//添加新supplier
	public void addSupplier(Supplier supplier);
	//根据ID获取supplier
	public Supplier getSupplierById(int id);
	//更新supplier的资料
	public void updateSupplier(Supplier supplier);
	//获取全部的supplier
	public List getAllSupplier();
	//删除指定的supplier
	public void deleteSupplier(Supplier supplier);
	//按搜索条件获取supplier
	public List getSupplierByConditionAndPage(String condition,int page,int pageSize);
	//按搜索条件,获取所有supplier的数量
	public Integer getCountOfSupplierByConditionAndPage(String condition);
}

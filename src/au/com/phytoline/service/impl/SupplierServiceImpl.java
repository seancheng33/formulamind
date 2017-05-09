package au.com.phytoline.service.impl;

import java.util.List;

import au.com.phytoline.dao.SupplierDAO;
import au.com.phytoline.entity.Pager;
import au.com.phytoline.entity.Supplier;
import au.com.phytoline.service.SupplierService;

public class SupplierServiceImpl implements SupplierService {
	SupplierDAO supplierDAO;

	public void setSupplierDAO(SupplierDAO supplierDAO) {
		this.supplierDAO = supplierDAO;
	}

	@Override
	public List getAllSupplierByPage(int page, int pageSize) {
		return supplierDAO.getAllSupplierByPage(page, pageSize);
	}

	@Override
	public Pager getCountOfSupplier(int pageSize) {
		int count = supplierDAO.getCountOfSupplier();
		Pager pager = new Pager();
		pager.setPerPageRows(pageSize);
		pager.setRowCount(count);
		return pager;
	}

	@Override
	public void addSupplier(Supplier supplier) {
		supplierDAO.addSupplier(supplier);
		
	}

	@Override
	public Supplier getSupplierById(int id) {
		return supplierDAO.getSupplierById(id);
	}

	@Override
	public void updateSupplier(Supplier supplier) {
		supplierDAO.updateSupplier(supplier);
	}

	@Override
	public void deleteSupplier(int id) {
		Supplier supplier= supplierDAO.getSupplierById(id);
		supplierDAO.deleteSupplier(supplier);
		
	}

	@Override
	public List getSupplierByConditionAndPage(String condition, int page,
			int pageSize) {
		return supplierDAO.getSupplierByConditionAndPage(condition, page, pageSize);
	}

	@Override
	public Pager getCountOfSupplierByConditionAndPage(String condition,int pageSize) {
		int count= supplierDAO.getCountOfSupplierByConditionAndPage(condition);
		Pager pager = new Pager();
		pager.setPerPageRows(pageSize);
		pager.setRowCount(count);
		return pager;
	}

	

}

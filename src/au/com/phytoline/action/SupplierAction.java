package au.com.phytoline.action;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import au.com.phytoline.entity.Pager;
import au.com.phytoline.entity.Supplier;
import au.com.phytoline.service.SupplierService;

import com.opensymphony.xwork2.ActionSupport;


public class SupplierAction extends ActionSupport implements SessionAware,
		RequestAware {

	private static final long serialVersionUID = -1846708308014031588L;
	Map<String, Object> session;
	Map<String, Object> request;

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;

	}

	SupplierService supplierService;

	public void setSupplierService(SupplierService supplierService) {
		this.supplierService = supplierService;
	}

	Pager pager;

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	int sid;

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	Supplier supplier;

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	String nameSearch;

	public String getNameSearch() {
		return nameSearch;
	}

	public void setNameSearch(String nameSearch) {
		this.nameSearch = nameSearch;
	}

	public String supplierList() throws Exception {
		int curPage = 1;
		if (pager != null) {
			curPage = pager.getCurPage();
		}
		List supplierList = null;
		if (nameSearch == null) {
			// 无查询条件，获取supplier的列表
			supplierList = supplierService.getAllSupplierByPage(curPage, 10);
			pager = supplierService.getCountOfSupplier(10);
		} else {
			// 有查询条件的
			supplierList = supplierService.getSupplierByConditionAndPage(
					nameSearch, curPage, 10);
			pager = supplierService.getCountOfSupplierByConditionAndPage(
					nameSearch, 10);
		}
		pager.setCurPage(curPage);
		request.put("supplierList", supplierList);
		request.put("nameSearch", nameSearch);
		return "supplierlist";
	}

	public String toAddSupplier() throws Exception {
		return "supplier_add";
	}

	public String addSupplier() throws Exception {
		//先校验各种数据的合法性等
		if(supplier.getSname()==null||supplier.getSname().equals("")){
			this.addFieldError("name", "supplier name can't empyt");
			return "error";
		}
		String pcode = supplier.getPostcode();
		
		if(pcode.length()!=9){
		this.addFieldError("postcode", "postcode length is 9 and the format is XXXX-XXXX.");
		return "error";
		}
		//在创建时间中填上当前时间
		supplier.setScreatedate(new Date());
		supplierService.addSupplier(supplier);
		return "supplierlist";
	}

	public String toSupplierModify() throws Exception {
		//根据页面传过来的sid的值，查找出对应的supplier，然后把值传给修改页面
		supplier = supplierService.getSupplierById(sid);
		request.put("supplier", supplier);
		return "supplier_modify";
	}

	public String doSupplierModify() throws Exception {
		//在更新数据前，先把修改时间填上当前时间
		supplier.setSmodifydate(new Date());
		supplierService.updateSupplier(supplier);
		return "supplierlist";
	}

	public String deleteSupplier() throws Exception {
		supplierService.deleteSupplier(sid);
		return "supplierlist";
	}

	public String supplierDetails() throws Exception {
		Supplier supplier = supplierService.getSupplierById(sid);
		request.put("supplier", supplier);
		return "supplierDetails";
	}
}

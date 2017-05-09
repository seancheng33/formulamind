package au.com.phytoline.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import au.com.phytoline.entity.Chemical;
import au.com.phytoline.entity.Pager;
import au.com.phytoline.entity.Supplier;
import au.com.phytoline.service.ChemicalService;
import au.com.phytoline.service.SupplierService;

import com.opensymphony.xwork2.ActionSupport;

public class ChemicalAction extends ActionSupport implements RequestAware,
		SessionAware {
	private static final long serialVersionUID = 5798979308504675280L;
	Chemical chemical;
	Pager pager;
	ChemicalService chemicalService;
	SupplierService supplierService;
	String nameSearch;
	int sid;

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getNameSearch() {
		return nameSearch;
	}

	public void setNameSearch(String nameSearch) {
		this.nameSearch = nameSearch;
	}

	public SupplierService getSupplierService() {
		return supplierService;
	}

	public void setSupplierService(SupplierService supplierService) {
		this.supplierService = supplierService;
	}

	public ChemicalService getChemicalService() {
		return chemicalService;
	}

	public void setChemicalService(ChemicalService chemicalService) {
		this.chemicalService = chemicalService;
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public Chemical getChemical() {
		return chemical;
	}

	public void setChemical(Chemical chemical) {
		this.chemical = chemical;
	}

	Map<String, Object> session;

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	Map<String, Object> request;

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public String chemicalList() throws Exception {
		int curPage = 1;
		if (pager != null) {
			curPage = pager.getCurPage();
		}
		List chemicalList = null;
		if (nameSearch == null) {
			// 无查询条件，获取supplier的列表
			chemicalList = chemicalService.getAllChemicalByPage(curPage, 10);
			pager = chemicalService.getCountOfChemical(10);
		} else {
			// 有查询条件的
			chemicalList = chemicalService.getChemicalByConditionAndPage(
					nameSearch, curPage, 10);
			pager = chemicalService.getCountOfChemicalByConditionAndPage(
					nameSearch, 10);
		}
		pager.setCurPage(curPage);
		request.put("chemicalList", chemicalList);
		request.put("nameSearch", nameSearch);
		return "chemicallist";
	}

	public String toAddChemical() throws Exception {
		List supplierList = supplierService.getAllSupplierByPage(1, 10);
		request.put("supplierList", supplierList);
		return "chemical_add";
	}

	public String addChemical() throws Exception {
		Supplier supplier = supplierService.getSupplierById(sid);

		chemical.setSupplier(supplier);
		chemicalService.addChemical(chemical);
		return "chemicallist";
	}
}
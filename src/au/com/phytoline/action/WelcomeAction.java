package au.com.phytoline.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import au.com.phytoline.service.BatchDetailsService;
import au.com.phytoline.service.BatchService;
import au.com.phytoline.service.ChemicalService;
import au.com.phytoline.service.ProductDetailsService;
import au.com.phytoline.service.ProductService;
import au.com.phytoline.service.SupplierService;

public class WelcomeAction extends ActionSupport implements RequestAware,
SessionAware{

	private static final long serialVersionUID = -2066561855186969690L;

	ProductService productService;
	ProductDetailsService productDetailsService;
	ChemicalService chemicalService;
	SupplierService supplierService;
	BatchService batchService;
	BatchDetailsService batchDetailsService;
	public ProductService getProductService() {
		return productService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public ProductDetailsService getProductDetailsService() {
		return productDetailsService;
	}
	public void setProductDetailsService(ProductDetailsService productDetailsService) {
		this.productDetailsService = productDetailsService;
	}
	public ChemicalService getChemicalService() {
		return chemicalService;
	}
	public void setChemicalService(ChemicalService chemicalService) {
		this.chemicalService = chemicalService;
	}
	public SupplierService getSupplierService() {
		return supplierService;
	}
	public void setSupplierService(SupplierService supplierService) {
		this.supplierService = supplierService;
	}
	public BatchService getBatchService() {
		return batchService;
	}
	public void setBatchService(BatchService batchService) {
		this.batchService = batchService;
	}
	public BatchDetailsService getBatchDetailsService() {
		return batchDetailsService;
	}
	public void setBatchDetailsService(BatchDetailsService batchDetailsService) {
		this.batchDetailsService = batchDetailsService;
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
	
	
	
	public String home() throws Exception {
		//读出一些建议的统计和简略的数据，用于在home页面显示
		List<?> supplierList = null;
		List<?> chemicalList = null;
		List<?> productList = null;
		List<?> batchList = null;
		
		//取出5条数据用于home页面的显示用
		supplierList = supplierService.getAllSupplierByPage(1, 5);
		chemicalList = chemicalService.getAllChemicalByPage(1, 5);
		productList = productService.getAllProductBypage(1, 5);
		batchList = batchService.getAllBatchByPager(1, 5);
		
		request.put("supplierList", supplierList);
		request.put("chemicalList", chemicalList);
		request.put("productList", productList);
		request.put("batchList", batchList);
		
		return "home";
	}

	
}

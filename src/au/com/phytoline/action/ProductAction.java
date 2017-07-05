package au.com.phytoline.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import au.com.phytoline.entity.Pager;
import au.com.phytoline.entity.Product;
import au.com.phytoline.service.ChemicalService;
import au.com.phytoline.service.ProductDetailsService;
import au.com.phytoline.service.ProductService;

public class ProductAction extends ActionSupport implements RequestAware,
		SessionAware {
	private static final long serialVersionUID = -2208805501107669256L;
	ProductService productService;
	ProductDetailsService productDetailsService;
	ChemicalService chemicalService;
	Pager pager;
	Product product;
	List chemList;
	public void setChemList(List chemList) {
		this.chemList = chemList;
	}
	public List getChemList() {
		return chemList;
	}
	public Product getProduct() {
		return product;
	}


	public void setProduct(Product product) {
		this.product = product;
	}


	public Pager getPager() {
		return pager;
	}


	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public void setChemicalService(ChemicalService chemicalService) {
		this.chemicalService = chemicalService;
	}
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	public void setProductDetailsService(
			ProductDetailsService productDetailsService) {
		this.productDetailsService = productDetailsService;
	}
	int pid;
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getPid() {
		return pid;
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

	
	public String productList(){
		int curPage = 1;
		if (pager != null) {
			curPage = pager.getCurPage();
		}
		List productList =null;
		
		productList=productService.getAllProductBypage(curPage, 10);
		pager = productService.getCountOfProduct(10);
		
		pager.setCurPage(curPage);
		request.put("productList", productList);
		return "productlist";
	}
	
	public String productDetails(){
		Product product=productService.findProductById(pid);
		List productDetailses = productDetailsService.getDetailsByProductId(product.getPid());
		request.put("product", product);
		request.put("productDetailses", productDetailses);
		return "productDetails";
	}
	
	public String toAddProduct(){
		//这里需要查询并传值chemical的全部list给页面，用json的格式
		chemList = chemicalService.getAllChemicalByPage(0, 100);
		System.out.println(chemList);
		request.put("chemList", chemList);
		return "addProduct";
	}
	public String doAddProduct(){
		Object obj = request.get("chemList");
		//JSONObject json = JSONObject.fromObject(request.get("chemList"));
		String str = obj.toString();
		
		System.out.println(str.replaceAll(" ", ""));
		
		
		return "productlist";
	}
}

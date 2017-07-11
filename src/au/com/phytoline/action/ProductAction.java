package au.com.phytoline.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import au.com.phytoline.entity.Chemical;
import au.com.phytoline.entity.Pager;
import au.com.phytoline.entity.Product;
import au.com.phytoline.service.ChemicalService;
import au.com.phytoline.service.ProductDetailsService;
import au.com.phytoline.service.ProductService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ProductAction extends ActionSupport implements RequestAware,
		SessionAware,ServletRequestAware{
	private static final long serialVersionUID = -2208805501107669256L;
	HttpServletRequest servletRequest;
	ProductService productService;
	ProductDetailsService productDetailsService;
	ChemicalService chemicalService;
	Pager pager;
	Product product;
	List chemList;
	String result;

	public void setResult(String result) {
		this.result = result;
	}
	public String getResult() {
		return result;
	}
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
		//System.out.println(chemList);
		request.put("chemList", chemList);
		return "addProduct";
	}
	public String doAddProduct(){
		
		return "productlist";
	}
	
	public String ajaxChem() {
		// 这里需要查询并传值chemical的全部list给页面，用json的格式
		chemList = chemicalService.getAllChemicalByPage(0, 100);

		ArrayList<Object> map = new ArrayList<Object>();
		for (int i = 0; i < chemList.size(); i++) {
			Map<String, Object> map2 = new HashMap<String, Object>();
			Chemical chem = (Chemical) chemList.get(i);

			map2.put("cid", chem.getCid());
			map2.put("cname", chem.getCname());
			map2.put("price", chem.getPrice());
			map.add(map2);
		}

		// JSONObject json = JSONObject.fromObject(map);
		JSONArray json = JSONArray.fromObject(map);
		result = json.toString();

		return "ajaxChem";
	}
	public String ajaxChemDetail() {
		// 接收页面过来的传值，查询后返回页面

		String cid = servletRequest.getParameter("cid");
		System.out.println(cid);
		Chemical chemical = chemicalService.getChemicalById(Integer.parseInt(cid));
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("cid", chemical.getCid());
			map.put("cname", chemical.getCname());
			map.put("price", chemical.getPrice());
		JSONObject json = JSONObject.fromObject(map);
		//JSONArray json = JSONArray.fromObject(map);
		result = json.toString();

		return "ajaxChemDetail";
	}
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.servletRequest = arg0;
	}

}

package au.com.phytoline.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.attribute.standard.PDLOverrideSupported;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import au.com.phytoline.entity.Chemical;
import au.com.phytoline.entity.Pager;
import au.com.phytoline.entity.Product;
import au.com.phytoline.entity.ProductDetails;
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
	ProductDetails productDetails;
	List chemList;
	String result;

	
	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}
	public void setProductDetails(ProductDetails productDetails) {
		this.productDetails = productDetails;
	}
	public ProductDetails getProductDetails() {
		return productDetails;
	}
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
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.servletRequest = arg0;
	}
	
	//
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
		//设置proudct
		String pname =servletRequest.getParameter("pname");
		String pcode = servletRequest.getParameter("pcode");
		//Date date = new Date(servletRequest.getParameter("pdate"));
		String pinfo = servletRequest.getParameter("pinfo");
				
		Product product= new Product();
		product.setPname(pname);
		product.setPcode(pcode);
		product.setPdate(new Date());
		product.setPinfo(pinfo);
		//以上数据保存到product表中
		productService.saveProduct(product);
		
		//获取刚存进去的那条数据的PID
		int pId = productService.getProductIdByNameAndCode(pname,pcode);
		//System.out.println(pId);
		//
		String json = servletRequest.getParameter("pdata");
		JSONArray detailsList = JSONArray.fromObject(json);//将获取的关于details的内容转化为json对象
		for(int i=1;i<detailsList.size();i++){
			//因为这段json的第一个对象，是table的th头，是空值，所以从第二个对象开始取值
			JSONObject dt = JSONObject.fromObject(detailsList.get(i));
			ProductDetails productDetails = new ProductDetails();
			productDetails.setpId(pId);
			productDetails.setPosition(Integer.parseInt((String) dt.get("position")));
			productDetails.setChemId(Integer.parseInt((String) dt.get("chemId")));
			productDetails.setChemName((String) dt.get("chemName"));
			productDetails.setChemPrice(Double.parseDouble((String) dt.get("chemPrice")));
			productDetails.setPercent(Double.parseDouble((String) dt.get("percent")));
			productDetails.setAmount(Double.parseDouble((String) dt.get("amount")));
			//将该数据保存到productdetails表中
			productDetailsService.saveProductDetails(productDetails);
		}
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
		//System.out.println(cid);
		Chemical chemical = chemicalService.getChemicalById(Integer.parseInt(cid));
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("cid", chemical.getCid());
			map.put("cname", chemical.getCname());
			map.put("price", chemical.getPrice());
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();

		return "ajaxChemDetail";
	}
	
	public String deleteProduct(){
		//根据pid查询出product对象，再根据product对象的pid查询出该product关联的details的list
		Product product=productService.findProductById(pid);
		List productDetailses = productDetailsService.getDetailsByProductId(product.getPid());
		//遍历details的list，将其删除
		for(int i=0;i<productDetailses.size();i++){
			ProductDetails details = new ProductDetails();
			details=(ProductDetails) productDetailses.get(i);
			productDetailsService.deleteProductDetails(details);
		}
		//删除了dteails的list的数据后，在将该product删除
		productService.deleteProduct(product);
		//这层product的删除，是不是应该有一个回滚机制，因为涉及到多张表的内容删除，内容待优化
		return "productlist";
	}

}
